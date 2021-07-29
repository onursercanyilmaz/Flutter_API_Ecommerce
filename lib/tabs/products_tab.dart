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
    //getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "🛍️ Products",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child:
          /*SingleChildScrollView(
              scrollDirection: Axis.horizontal, //yatay kaydırma
              child: Row(
                children: categoryWidgets,
              ),
            ),*/
          ProductListWidget(products),

        ),
      ),
    );
  }
  /*
  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response
            .body); // iterable iterasyon tasarım deseni, array list hepsi iterable
        this.categories =
            list.map((category) => Category.formJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }*/

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return Row(children: [
      FlatButton(
        child: Text(
          category.categoryName,
          style: const TextStyle(color: Colors.green),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.green)),
        onPressed: () {
          getProductsByCategoryId(category);
        },

        /*color: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.5,-0.6),
              radius: 0.15,
               colors: <Color>[
          const Color(0xFFEEEEEE),
          const Color(0xFF111133),
        ],
        stops: <double>[0.9, 1.0],
            ),
          ),
        ),*/
      ),
      const SizedBox(
        width: 10,
      ),
    ]);
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
