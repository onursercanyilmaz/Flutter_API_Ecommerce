
import "package:http/http.dart" as http;

class CategoryApi {
  static Future getCategories() {
    var url = Uri.tryParse("https://fenerium-flutter-default-rtdb.europe-west1.firebasedatabase.app/CategoryList.json");
    return http.get(url!);
  }

}
