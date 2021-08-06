import 'dart:async';

import 'package:ecommerceosy/models/product.dart';
import 'package:ecommerceosy/services/api/product_api.dart';


var _productApi = ProductApi();

class ProductBloc {


  final productStreamController = StreamController.broadcast();

  Stream get getStream => productStreamController.stream;

   Future getAll() {
    return ProductApi.getProducts();
  }
}

final productBloc = ProductBloc();