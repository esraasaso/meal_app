import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '/widget/category_item.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = 'categor_meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();

}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var categoryTitle;
late List <Meal> displayMeal;
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
void remove_meal(String mealid){
    setState(() {
      displayMeal.removeWhere((meal) => meal.id==mealid);
    });
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle')),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:displayMeal[index].id,
            imageUrl: displayMeal[index].imageUrl,
            title:displayMeal[index].title,
            complexity: displayMeal[index].complexity,
            affordability:displayMeal[index].affordability,
            duration: displayMeal[index].duration,

          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
