import 'package:ecommerceosy/services/auth.dart';
import 'package:ecommerceosy/screens/user/register_screen.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 // User? user = FirebaseAuth.instance.currentUser;

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://fenerium.com/assets/img/subscribe-bg-img.png"),
              ),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(60.0)),
                        child: Container(
                          height: 100.0,
                          width: double.infinity,
                          color: const Color(0xff1D2F75),
                          child: Center(
                            child: SvgPicture.network(
                                "https://fenerium.com/images/logo.svg"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 75),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 150,
                            height: 150,
                            child: Center(
                              child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/tr/thumb/8/85/200px-Fenerbah%C3%A7e.png/800px-200px-Fenerbah%C3%A7e.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          color: Colors.black12,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "E-mail"),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 75),
                        child: Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                padding: EdgeInsets.only(left: 30, right: 30),
                                color: Colors.black12,
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passwordController,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15, bottom: 11, top: 11, right: 15),
                                      hintText: "Şifre"),
                                )),
                          ),
                        )),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 40.0,
                    width: 250,
                    color: Colors.blue,
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 100.0,
                        child: RaisedButton(
                          color: Color(0xff1D2F75),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: const Text(
                            "Hesabın Yok Mu?",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60.0)),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 100.0,
                        child: RaisedButton(
                          color: Color(0xff1D2F75),
                          onPressed: () {
                            logInShortCut();
                          },
                          child: const Text(
                            "Giriş Yap",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void logInShortCut() {/*
    _authService
        .logIn(_emailController.text, _passwordController.text)
        .then((value) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("HATA"),
              content: Text(err.code),
              actions: [
                FlatButton(
                  child: Text("Tamam"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  */}
}
