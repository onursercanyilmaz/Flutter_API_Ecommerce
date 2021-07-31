import 'package:ecommerceosy/models/category.dart';
import 'package:flutter/material.dart';

class CategoryListRowWidget extends StatelessWidget {
  Category category;

  CategoryListRowWidget(this.category, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildCategoryItemCard(context);
  }

  Widget buildCategoryItemCard(BuildContext context) {
    return InkWell(
      onTap: (){},

      child: Card(
        color: Color(0xffEDEEF0),
        child: ListView(
          primary: false,
          children: [
            SizedBox(
              child: Image.network(category.image, alignment: Alignment.bottomCenter,),
              height: 105.0,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Center(
                child: Text(
              category.categoryName.toString(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 18.0, color: Colors.blue),
            )),
          ],
        ),
      ),
    );
  }
}
