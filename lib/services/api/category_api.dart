import 'dart:convert';

import "package:http/http.dart" as http;

class CategoryApi {
  static Future getCategories() {
    var url = Uri.tryParse("https://fakestoreapi.com/products/categories");

    return http.get(url!);
  }
}
