import 'dart:convert';

import 'package:ecommerceosy/models/category.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/services/api/category_api.dart';
import 'package:ecommerceosy/services/api/product_api.dart';
import 'package:ecommerceosy/widgets/category_list_widget.dart';
import 'package:ecommerceosy/widgets/product_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CategoriesTabState();
  }

}

class _CategoriesTabState extends State{

  List<Category> categories = <Category> [];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {

    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2F75),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child:
          CategoryListWidget(categories),

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



  void getCategories() {
    CategoryApi.getCategories().then((response) {

      if (mounted)
        {setState(() {
          Iterable list = json.decode(response.body);
          categories =
              list.map((category) => Category.formJson(category)).toList();
        });}

    });
  }

  @override
  void dispose() {
   //getCategories();
    super.dispose();
  }
}
