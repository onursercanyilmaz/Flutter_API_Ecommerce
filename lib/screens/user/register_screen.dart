import 'package:ecommerceosy/services/auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
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
                          color: Colors.amberAccent.shade400,
                          child: Center(
                            child: SvgPicture.network(
                                "https://fenerium.com/images/logo.svg"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
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
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          color: Colors.black12,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Ad Soyad"),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                margin: const EdgeInsets.only(left: 30, right: 30),
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                color: Colors.black12,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "E-mail"),
                                )),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                margin: const EdgeInsets.only(left: 30, right: 30),
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                color: Colors.black12,
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passwordController,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "Şifre"),
                                )),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                padding: EdgeInsets.only(left: 30, right: 30),
                                color: Colors.black12,
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneController,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      hintText: "Telefon"),
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
                    color: Colors.transparent,
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 100.0,
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Hesabın Var Mı?",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 18,
                              color: Color(0xff1D2F75),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top:  Radius.circular(60.0)),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 100.0,
                        child: RaisedButton(
                          color: Colors.amberAccent.shade400,
                          onPressed: () {
                            registerShortCut();
                          },
                          child: const Text(
                            "Kaydol",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 22,
                              color: Color(0xff1D2F75),
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

  void registerShortCut() {/*
    _authService
        .register(_emailController.text, _passwordController.text,
        _nameController.text, _phoneController.text)
        .then((value) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("HATA"),
              content: Text(err.code),
              actions: [
                FlatButton(
                  child: const Text("Tamam"),
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
