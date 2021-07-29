class Category {
  late int id;
  late String image;
  late String categoryName;


  Category(this.id,this.image, this.categoryName);

  Category.formJson(Map json) {
    id = json["id"];
    image =  json["image"];
    categoryName = json["name"];

  }

  Map toJson() {
    return {"id": id, "image":image, "name": categoryName, };
  }
}
