import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/widgets/product_list_row.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = <Product>[];

  ProductListWidget(List<Product> products, {Key? key}) : super(key: key) {
    this.products = products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  //RepaintBoundary ← NotificationListener<ScrollNotification> ← GlowingOverscrollIndicator ← Scrollable ← PrimaryScrollController ← GridView ← Expanded ← SizedBox ← Column ← ProductListWidget ← ⋯
  Widget buildProductList(BuildContext context) {
    return
       Scrollbar(
         child: GridView.count(
           shrinkWrap: true,
           crossAxisCount: 2,
           children: List.generate(widget.products.length, (index) {
             return ProductListRowWidget(widget.products[index]);
           }),
         ),
       );
  }
}
