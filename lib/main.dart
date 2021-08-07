
import 'package:ecommerceosy/screens/login_screen.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
