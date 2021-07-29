import "package:http/http.dart" as http;

class ProductApi {

  static Future getProducts() {
    var url = Uri.tryParse("https://fakestoreapi.com/products");
    return http.get(url!);
  }

  static Future getProductsByCategoryId(int categoryId) {
    var url =
        Uri.tryParse("https://fakestoreapi.com/products/$categoryId");
    return http.get(url!);
  }
}
