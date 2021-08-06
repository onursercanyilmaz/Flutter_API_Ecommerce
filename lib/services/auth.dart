
import 'dart:convert';
import 'dart:io';

import 'package:ecommerceosy/models/user.dart';
import 'package:http/http.dart';

class AuthService {



  Future<User?> logIn(String email, String password) async {
    var user = await "$email:$password:61:61:TRTR";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String authEncoded = "BASIC " + stringToBase64.encode(user);

    var url = Uri.tryParse("https://jptest.diyalogo.com.tr/logo/restservices/rest/login");
    final response = await post(
       url!,
      headers: {
        HttpHeaders.authorizationHeader: authEncoded,
      }
    );
    
    return User.formJsonMap(json.decode(response.body));

  }
/*
  logOut() async {
    return await _auth.signOut();
  }

  Future<User?> register(
      String email, String password, String name, String phone) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Person").doc(user.user!.uid).set({
      "name-surname": name,
      "email": email,
      "password": password,
      "phone": phone,
      "addres": null,
    });

    return user.user;
  }*/


}
