import 'dart:convert';

import 'package:ecommerceosy/models/category.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/services/api/product_api.dart';
import 'package:ecommerceosy/widgets/product_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductsTabState();
  }

}

class _ProductsTabState extends State{

  List<Category> categories = <Category> [];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {

    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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



  void getProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products =
            list.map((product) => Product.formJson(product)).toList();
      });
    });
  }
}
