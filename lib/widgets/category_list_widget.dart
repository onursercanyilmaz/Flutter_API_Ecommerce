import 'package:ecommerceosy/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'category_list_row.dart';


class CategoryListWidget extends StatefulWidget {
  List<Category> categories = <Category>[];

  CategoryListWidget(List<Category> categories, {Key? key}) : super(key: key) {
    this.categories = categories;
  }

  @override
  State<StatefulWidget> createState() {
    return _CategoryListWidgetState();
  }
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildCategoryList(context);
  }

  //RepaintBoundary ← NotificationListener<ScrollNotification> ← GlowingOverscrollIndicator ← Scrollable ← PrimaryScrollController ← GridView ← Expanded ← SizedBox ← Column ← ProductListWidget ← ⋯
  Widget buildCategoryList(BuildContext context) {
    return
      Scrollbar(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(widget.categories.length, (index) {
            return CategoryListRowWidget(widget.categories[index]);
          }),
        ),
      );
  }
}
