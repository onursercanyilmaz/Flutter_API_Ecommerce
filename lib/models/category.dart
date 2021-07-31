class Category {
  late int id;
  late String image;
  late String categoryName;
  late String categoryCode;


  Category(this.id,this.image, this.categoryName, this.categoryCode);

  Category.formJson(Map json) {
    id = json["id"];
    image = json["Image"];
    categoryName = json["CategoryName"];
    categoryCode = json["CategoryCode"];

  }

  Map toJson() {
    return {"id": id, "Image":image, "CategoryName": categoryName, "CategoryCode":categoryCode };
  }
}
