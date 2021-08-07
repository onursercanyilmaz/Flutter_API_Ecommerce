import 'package:ecommerceosy/models/user.dart';
import 'package:ecommerceosy/screens/user/register_screen.dart';
import 'package:ecommerceosy/services/api/product_api.dart';
import 'package:ecommerceosy/services/auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main_screen.dart';

final storage = new FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _authService = AuthService();
  final _productApi = ProductApi();

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
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(60.0)),
                          child: Container(
                            height: 150.0,
                            width: double.infinity,
                            color: const Color(0xffCC222B),
                            child: Center(
                              child:
                                  Image.asset("lib/assets/jcommerceWhite.png"),

                              /*SvgPicture.network(
                         "https://fenerium.com/images/logo.svg"),
                     NetworkImage(
                       "https://fenerium.com/assets/img/subscribe-bg-img.png"), */
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 115),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff1D2F75),
                                    borderRadius: BorderRadius.circular(100)),
                                width: 150,
                                height: 150,
                                child: Image.network(
                                  "https://image.flaticon.com/icons/png/512/152/152533.png",
                                  color: Colors.white,
                                  cacheWidth: 80,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Align(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    color: const Color(0xffCC222B),
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: _emailController,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color(0xffff9898)),
                                          filled: true,
                                          fillColor: Color(0xffCC222B),
                                          focusColor: Color(0xffCC222B),
                                          hoverColor: Color(0xffe55c63),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                          hintText: "Email"),
                                    )),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Align(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    color: const Color(0xffCC222B),
                                    child: TextFormField(
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: _passwordController,
                                      cursorColor: Colors.white,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Color(0xffff9898)),
                                          filled: true,
                                          fillColor: Color(0xffCC222B),
                                          focusColor: Color(0xffCC222B),
                                          hoverColor: Color(0xffe55c63),
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
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()),
                                );
                              },
                              child: const Text(
                                "Hesabın Yok Mu?",
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
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 300,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(50, 50)),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Center(
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 100.0,
                              child: RaisedButton(
                                color: const Color(0xff1D2F75),
                                onPressed: () {
                                  loginShortCut();
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
                    ),
                  ]),
            ),
          ),
        ));
  }

  void loginShortCut() {

    _authService
        .logIn(_emailController.text, _passwordController.text)
        .then((value) {
      storage.write(key: "authToken", value: value!.authorization);
      print("LOGIN TOKEN YENI: " + value.authorization);
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(2, token: value.authorization)));
    }).catchError((err) {
      print("HATA ");

      _showError(context);
    });
  }

  void _showError(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: const Color(0xff153e71),
              child: Wrap(
                children: [
                  ListTile(
                      title: const Text("Hatalı Giriş",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onTap: () {}),
                ],
              ),
            ),
          );
        });
  }
}
