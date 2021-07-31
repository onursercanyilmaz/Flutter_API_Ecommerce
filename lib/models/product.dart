class Product {
  late String id;
  late String category;
  late String title;
  late String image;
  late double price;
  late String description;

  Product(this.id, this.category, this.title, this.image,
      this.price, this.description);

  Product.formJson(Map json) {
    id = json["id"];
    category = json["CategoryName"];
    title = json["ProductName"];
    image = json["Image"];
    price = double.tryParse(json["Price"].toString())!;
    description = json["Link"];
  }

  Map toJson() {
    return {
      "id": id,
      "CategoryName": category,
      "ProductName": title,
      "Image": image,
      "Price": price,
      "Link": description
    };
  }
}
