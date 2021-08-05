import 'package:ecommerceosy/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import 'package:ecommerceosy/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;
  List<Product> products = <Product>[];

  ProductListRowWidget(this.product, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product)));


          },
        child: Card(
          color: const Color(0xffEDEEF0),

          child: ListView(

            primary: false,
            children: [
              SizedBox(
                child: Image.network(product.image),
                height: 105.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Center(child: Text(product.title, style: const TextStyle(), textAlign: TextAlign.center,)),

              Center(
                child: Text(
                  product.price.toString(),
                  style: const TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ),

            ],
          ),
        ),
      );
  }
}
