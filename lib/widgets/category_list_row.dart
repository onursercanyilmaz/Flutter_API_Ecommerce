import 'package:ecommerceosy/models/category.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceosy/models/product.dart';

class CategoryListRowWidget extends StatelessWidget {
  Category category;

  CategoryListRowWidget(this.category, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: ListView(

          children: [
            SizedBox(
              child: Image.network("https://i2.wp.com/pazar.evrimagaci.org/wp-content/uploads/2020/11/DUNE-SETI.png?fit=2000%2C2000&ssl=1"),//Image.network(category.image),
              height: 105.0,
              width: MediaQuery.of(context).size.width / 2,
            ),
             Center(child:Text(category.categoryName)),

          ],
        ),
      ),
    );
  }
}
