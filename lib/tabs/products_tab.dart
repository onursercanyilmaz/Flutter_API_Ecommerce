
import 'dart:convert';
import 'dart:core';

import 'package:ecommerceosy/blocs/product_bloc.dart';
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
  List<Product> products = <Product>[];


  @override
  void initState() {
    //getProducts();
    myToken = widget.token;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D2F75),
      body:
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child:showProducts(),

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

  showProducts()
  {
    return FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          return ProductListWidget(products);


        }
    );
  }

 getProducts ()
{

  productBloc.getAll().then((response) {

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


}
