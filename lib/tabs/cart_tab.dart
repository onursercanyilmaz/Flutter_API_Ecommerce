import 'dart:typed_data';

import 'package:ecommerceosy/blocs/cart_bloc.dart';
import 'package:ecommerceosy/models/cart.dart';
import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/services/cart_service.dart';
import 'package:ecommerceosy/widgets/stateful_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

calculateCartTotal()
{
    num total = 0;
    var cartList = cartBloc.getCart();
    for(var element in cartList){
      total = total + element.product.price;
    }

    print(total);
    return total;
}
num newPrice = calculateCartTotal();


class CartTab extends StatefulWidget {

    const CartTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CartTabState();
  }
}



class _CartTabState  extends State<CartTab>{



  @override
  void initState() {
    super.initState();
    cartBloc.getCart();
    newPrice=calculateCartTotal();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar:  BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: StreamBuilder(
              stream: cartBloc.getStream,
              initialData: cartBloc.getCart(),
              builder: (context, snapshot) {
                return Text("Toplam: $newPrice", style: TextStyle(fontSize: 25, color: Colors.white),);

              },
            )),





            SizedBox(
                width: 150,
                child: cartBloc.getCart().isNotEmpty ?
                ClipRRect(

                  borderRadius: const BorderRadius.all(Radius.elliptical(50, 50)),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 100.0,
                        child: RaisedButton(
                          color: const Color(0xffCC222B),
                          onPressed: () {
                            // registerShortCut();
                          },
                          child: const Text(
                            "Satın Al",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ): ClipRRect(

                  borderRadius: const BorderRadius.all(Radius.elliptical(50, 50)),
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 100.0,
                        child: RaisedButton(
                          color: const Color(0xffCC222B),
                          onPressed: () {
                            // registerShortCut();
                          },
                          child: const Text(
                            "Sepet Boş",
                            style: TextStyle(
                              fontFamily: "Rubik",
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
        color: const Color(0xffCC222B),
      ),
      body:StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, snapshot) {
          return buildCart(snapshot);

        },
      ),
    );

  }}

Widget buildCart(AsyncSnapshot snapshot) {

  return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data;

        return SingleChildScrollView(
          child: ListTile(
            shape: Border.all(
                color: const Color(0xff1d2f75),
                style: BorderStyle.solid,
                width: 10),
            leading: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: MemoryImage(base64Decode(cart[index].product.image)),
                  )
                ],
              ),
            ),
            title: Text(cart[index].product.title),
            subtitle: Text(
              cart[index].product.price.toString(),
              style: const TextStyle(),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartBloc.removeFromCart(cart[index]);
                newPrice = calculateCartTotal();


              },
            ),
          ),
        );
      });


  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

}
