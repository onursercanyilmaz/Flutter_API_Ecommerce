
import 'dart:convert';
import 'dart:core';

import 'package:ecommerceosy/blocs/cart_bloc.dart';
import 'package:ecommerceosy/blocs/product_bloc.dart';
import 'package:ecommerceosy/models/cart.dart';
import "package:http/http.dart" as http;
import 'package:http/src/response.dart';
import 'package:ecommerceosy/models/category.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/services/api/product_api.dart';
import 'package:ecommerceosy/widgets/product_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


var myToken;
class ProductsTab extends StatefulWidget {
   ProductsTab({Key? key, this.token}) : super(key: key);
    var token;

  @override
  State<StatefulWidget> createState() {
    return _ProductsTabState();

  }

}

class _ProductsTabState extends State<ProductsTab>{

  List<Category> categories = <Category> [];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  var _productApi = ProductApi();

  @override
  void initState() {
    getPro();
    myToken = widget.token;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("HELLO WORLD----->>>"+ myToken);
    return Scaffold(
      backgroundColor: const Color(0xff1D2F75),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child:
          ProductListWidget(products),

        ),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products =
            list.map((product) => Product.formJson(product)).toList();
      });
    });
  }

  /*void getProductss() {
    _productApi.getProducts().then((response) {

      print("RESPONSE----->>>"+ response.toString());

      if(mounted)
        {setState(() {
          Iterable list = json.decode(response.body)['data'];
          products =
              list.map((product) => Product.formJson(product)).toList();


        });}

    });
  }*/

 /* static Future getProducts()
  {
  var authToken = "61:" + myToken.toString() + ":" + "INTERNALUSER";
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String productEncoded = stringToBase64.encode(authToken);

  print("AUTHTOKEN----->" + productEncoded);
  final getUrl = Uri.parse(
      'https://jptest.diyalogo.com.tr/logo/rest/v1.0/mmitemexchanges?offset=0&limit=100&direction=desc&expandlevel=25');
  final response =  http.get(
  getUrl,
  headers: {
  "content-type": "application/json",
  "Auth-Token": productEncoded ,
  },

  );

  print("RESPONSE MU ------>>>>>>>>>"+ response.toString());
  return response;

}*/

void getPro() async
{
  await ProductApi.getProducts().then((response) {


    if(mounted)
    {
      setState(() {
        Iterable list = json.decoder.convert(response.body)['data']["items"];
        products =
            list.map((product) => Product.formJson(product)).toList();
      });


   }

  });
}


  @override
  void dispose() {
   getPro();
    super.dispose();
  }
}
