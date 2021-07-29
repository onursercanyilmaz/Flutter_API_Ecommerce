import 'package:flutter/material.dart';
import 'package:ecommerceosy/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;

  ProductListRowWidget(this.product, {Key? key}) : super(key: key);
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
                child: Image.network(product.image),
                height: 105.0,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Center(child: Text(product.title)),
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
