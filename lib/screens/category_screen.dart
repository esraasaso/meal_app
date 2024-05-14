
import 'package:flutter/material.dart';
import '/models/category.dart';
import '../widget/category_item.dart';
import '../dummy_data.dart';
class CategoryScreen extends StatelessWidget {

  const CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding:const EdgeInsets.all(15),

        children: DUMMY_CATEGORIES.map((i) {
          return CategoryItem(i.id, i.title, i.color);
        }).toList(),
          gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent
        (
          maxCrossAxisExtent:200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      )),
    );
  }
}
