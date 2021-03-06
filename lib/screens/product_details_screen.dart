import 'dart:convert';
import 'dart:typed_data';

import 'package:ecommerceosy/models/cart.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/blocs/cart_bloc.dart';
import 'package:ecommerceosy/screens/admin/edit_product_screen.dart';
import 'package:ecommerceosy/screens/main_screen.dart';
import 'package:ecommerceosy/services/api/product_api.dart';
import 'package:ecommerceosy/tabs/products_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsScreenState();
  }
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var product;

  @override
  void initState() {
    setState(() {
      product = widget.product;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: const Color(0xff1D2F75),
          child: const Icon(Icons.arrow_back),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                    "https://fenerium.com/assets/img/subscribe-bg-img.png"),
              ),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 410,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(60.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(60.0)),
                          child: Container(
                            height: 400.0,
                            width: double.infinity,
                            color:  Colors.white,
                            child: Center(
                              child: product.image == "null"
                                  ? Center(
                                      child: Image.asset(
                                          "lib/assets/jcommerceWhite.png"),
                                    )
                                  : Image.memory(
                                      dataFromBase64String(product.image),
                                      alignment: Alignment.topCenter,
                                      scale: 2,
                                    ),

/*
                              Image.memory(
                                base64Decode(product.image),
                                alignment: Alignment.topCenter,
                                scale: 2,
                              ),*/

                              /*SvgPicture.network(
                         "https://fenerium.com/images/logo.svg"),
                     NetworkImage(
                       "https://fenerium.com/assets/img/subscribe-bg-img.png"), */
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 375),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff1D2F75),
                                    borderRadius: BorderRadius.circular(40)),
                                width: 200,
                                height: 50,
                                child: Center(
                                    child: Text(
                                  product.price.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 33),
                                ))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(
                      children: [
                        Center(
                            child: Text(
                          product.title,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 300,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(50, 50)),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Center(
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 100.0,
                              child: RaisedButton(
                                color: const Color(0xff1D2F75),
                                child: const Text(
                                  "Sepete Ekle",
                                  style: TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  cartBloc.addToCart(Cart(product, 1));
                                  _showPicker(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(50, 50)),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Center(
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 100.0,
                              child: RaisedButton(
                                color: Colors.white,
                                child: const Text(
                                  "??r??n?? D??zenle",
                                  style: TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 22,
                                    color: Colors.green,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditProductScreen(product),
                                      ));
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(50, 50)),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          color: Colors.blue,
                          child: Center(
                            child: ButtonTheme(
                              minWidth: 400.0,
                              height: 100.0,
                              child: RaisedButton(
                                color: Colors.white,
                                child: const Text(
                                  "??r??n?? Sil",
                                  style: TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 22,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                onPressed: () {
                                  deleteProductShortCut();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }

  void deleteProductShortCut() {
    ProductApi.deleteProduct(myToken.toString(), widget.product.id).then((value){

      Navigator.pop(context);
    }).catchError((err) {
      print("HATA " + err.toString());

      _showError(context);
    });
  }

  void _showError(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: const Color(0xff153e71),
              child: Wrap(
                children: [
                  ListTile(
                      title: const Text("Hatal?? ????lem",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onTap: () {}),
                ],
              ),
            ),
          );
        });
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: Color(0xff153e71),
              child: Wrap(
                children: [
                  ListTile(
                      title: const Text("Sepete Eklendi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MainScreen(4),
                            ));
                      },),

                ],
              ),
            ),
          );
        });
  }

}




