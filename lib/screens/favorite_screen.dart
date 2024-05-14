import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';
class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoriteScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return const  Text("no favorite meal");
    }
    else {
      return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id:favoriteMeal[index].id,
          imageUrl: favoriteMeal[index].imageUrl,
          title:favoriteMeal[index].title,
          complexity: favoriteMeal[index].complexity,
          affordability:favoriteMeal[index].affordability,
          duration: favoriteMeal[index].duration,
         
        );
      },
      itemCount: favoriteMeal.length,
    );
    }
  }
}
