class Product {
  late int id;
  late String category;
  late String title;
  late String image;
  late double price;
  late String description;

  Product(this.id, this.category, this.title, this.image,
      this.price, this.description);

  Product.formJson(Map json) {
    id = json["id"];
    category = json["category"];
    title = json["title"];
    image = json["image"];
    price = double.tryParse(json["price"].toString())!;
    description = json["description"];
  }

  Map toJson() {
    return {
      "id": id,
      "category": category,
      "title": title,
      "image": image,
      "price": price,
      "description": description
    };
  }
}
