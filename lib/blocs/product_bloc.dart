import 'dart:async';

import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/services/api/product_api.dart';



class ProductBloc {
  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

  static Future getAll() {
    return ProductApi.getProducts();
  }
}

final productBloc = ProductBloc();