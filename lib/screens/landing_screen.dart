

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(
                child: Text("Error"),
              ));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            //stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ));
              }

              if (streamSnapshot.connectionState == ConnectionState.active) {
                Object? _user = streamSnapshot.data;
                if (_user == null) {
                  return LoginScreen();
                } else {
                  return MainScreen();
                }
              }

              return const Scaffold(
                body: Center(
                  child: Text(
                    "Checking Account...",

                  ),
                ),
              );
            },
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text(
                "Loading...",

              ),
            ),
          );
        }
      },
    );
  }
}
