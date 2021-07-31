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
      onTap: (){print(this.product.title);},
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
              Center(child: Text(product.category)),
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
