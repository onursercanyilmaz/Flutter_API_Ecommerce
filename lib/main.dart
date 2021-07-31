import 'package:ecommerceosy/screens/admin/add_product_screen.dart';
import 'package:ecommerceosy/screens/landing_screen.dart';
import 'package:ecommerceosy/screens/login_screen.dart';
import 'package:ecommerceosy/screens/main_screen.dart';
import 'package:ecommerceosy/screens/user/register_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: MainScreen(),
    );
  }
}
