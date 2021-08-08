import 'dart:convert';
import 'dart:io';

import 'package:ecommerceosy/blocs/cart_bloc.dart';
import 'package:ecommerceosy/blocs/product_bloc.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/tabs/products_tab.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';

class ProductApi {

  static Future getProductsByCategoryId(int categoryId) {
    var url =
    Uri.tryParse("https://fakestoreapi.com/products/$categoryId");
    return http.get(url!);
  }

  final storage = const FlutterSecureStorage();

  Future<Map<String, String?>?> getAuthToken() async {
    var store = {
      'authToken': await storage.read(key: "authToken")
    };
    return store;
  }

  static Future getProducts() {
    var authToken = "61:" + myToken.toString() + ":" + "INTERNALUSER";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String productEncoded = stringToBase64.encode(authToken);

    final url = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges?expandlevel=25');
    final response = http.get(
      url,
      headers: {
        "content-type": "application/json; charset=UTF-8",
        "Auth-Token": productEncoded,
      },
    );

    print("RESPONSE MU ------>>>>>>>>>" + response.toString());
    return response;
  }

  static Future addProduct(String token, code, name,
      encodedImage) async {
    var authToken = "61:" + token.toString() + ":" + "INTERNALUSER";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedAuthKey = stringToBase64.encode(authToken);
    print("ENCODEDIMAGE------->>>  "+ encodedImage.toString());
    var addJson = json.decode("{"
        "\"data\": {"
        "\"code\": \"$code\","
        "\"name\": \"$name\","
        "\"mainImage\": {"
        "\"document\": \"${encodedImage.toString()}\","
        "\"items\": []"
        "}"
        "}"
        "}");


    final url = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges/');
    final add = await http.post(
      url,
      headers: {
        'content-type': 'application/json; charset=UTF-8',
        'Auth-Token': encodedAuthKey
      },
      body: json.encode(addJson['data']),
    );

    print(add.body);
    print("ADD STATUS CODE----->>>>" + add.statusCode.toString());
    return add.statusCode;
  }


  static Future updateProduct(String token, code, name,
      encodedImage, productId) async {
    var authToken = "61:" + token.toString() + ":" + "INTERNALUSER";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedAuthKey = stringToBase64.encode(authToken);

    print("ENCODEDIMAGE------->>>  "+ encodedImage.toString());

    var updateJson = json.decode("{"
        "\"data\": {"
        "\"code\": \"$code\","
        "\"name\": \"$name\","
        "\"mainImage\": {"
        "\"document\": \"${encodedImage.toString()}\","
        "\"items\": []"
        "}"
        "}"
        "}"
    );

    final url = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges/$productId');
    final update = await put(
      url,
      headers: {
        'content-type': 'application/json; charset=UTF-8',
        'Auth-Token': encodedAuthKey
      },
      body: json.encode(updateJson['data']),
    );

    print(update.body);
    print("UPDATE STATUS CODE----->>>>" + update.statusCode.toString());
    return update.statusCode;
  }


  static Future deleteProduct(token, productId) async
  {
    var authToken = "61:" + token.toString() + ":" + "INTERNALUSER";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedAuthKey = stringToBase64.encode(authToken);


    final url = Uri.parse(
        'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges/$productId');
    final delete =  await http.delete(
      url,
      headers: {
        'content-type': 'application/json',
        'Auth-Token': encodedAuthKey
      },
    );

    print("DELETE RESPONSE CODE ---->>>" + delete.statusCode.toString());
    return delete.statusCode;
  }


/* Future getProducts() async{
    getAuthToken().then((value) async {

      var authToken = "61:" + value!['authToken']! + ":" + "INTERNALUSER";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String productEncoded = stringToBase64.encode(authToken);

      print("AUTHTOKEN----->" + productEncoded);
      final getUrl = Uri.parse(
          'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges?offset=0&limit=100&direction=desc&expandlevel=25');
      final response = await http.get(
        getUrl,
        headers: {
          "content-type": "application/json",
          "Auth-Token": productEncoded ,
        },

      );
      print("RESPONSE ------->>>"+response.statusCode.toString());
      final responseJson = json.decode(response.body)['data'];
      print("VERI--------->"+responseJson.toString());

      return Product.formJson(responseJson);
/*
      final response = await post(
          url!,
          headers: {"content-type": "application/json",
            "Auth-Token": productEncoded ,},
         );
      print("statlar "+response.statusCode.toString());
      final data = json.decode(response.body);
      print("dataMAHMUT"+data);
      final responseJson = json.decode(utf8.decode(response.bodyBytes))['data'];


      return Product.formJson(responseJson);*/
    });

  }*/
/* static Future getProducts() {
    var url = Uri.tryParse("https://feneriumjson.herokuapp.com/Products.json");
    return http.get(url!);
  }

  static Future getProductsByCategoryId(int categoryId) {
    var url =
        Uri.tryParse("https://fakestoreapi.com/products/$categoryId");
    return http.get(url!);
  }

  static Future getCategoryofProducts(int categoryId) {
    var url =
    Uri.tryParse("https://fakestoreapi.com/products/$categoryId");
    return http.get(url!);
  }*/
/*
  static Future getProducts() {
    var url = Uri.tryParse("https://fenerium-flutter-default-rtdb.europe-west1.firebasedatabase.app/Products.json");
    return http.get(url!);
  }*/

}