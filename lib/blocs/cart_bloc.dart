import 'dart:async';

import 'package:ecommerceosy/models/cart.dart';
import 'package:ecommerceosy/services/cart_service.dart';



class CartBloc {
  final cartStreamController = StreamController.broadcast();
  //Future : bir işlem başlayınca diğer işlemler da aynı anda yapılabiliyordu
// Stream : İlerleyen zamanda aynı işlemi bir daha yapabiliyor. datayı oluşturup sürekli gönderilebiliyor. akış
  //final çalışma anında oluşur ve bir daha değiştirilemez
// const un çalışma anında işleme konan hali
  Stream get getStream => cartStreamController.stream;

   void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
    //sink aralıklı zamanlarda ne zaman çalışaılcak belirleyen kod
    //sink iletişimi sağlar, streami uyandırır. parametresi bir event
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }

}

final cartBloc = CartBloc();