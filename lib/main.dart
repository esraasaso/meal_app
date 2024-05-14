import 'package:flutter/material.dart';
import '../dummy_data.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/taps_screen.dart';
import 'models/meal.dart';
import 'screens/category_screen.dart';
import 'screens/filter_screen.dart';
void main() => runApp( MyApp());


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List <Meal> favoriteMeal=[];

void togelfavorite(String mealId){
  final existingIndex = favoriteMeal.indexWhere((meal) => meal.id==mealId);
  if(existingIndex>=0){
    setState(() {
favoriteMeal.removeAt(existingIndex);
    });
  }
  else {
    setState(() {
    favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId
    ));
  });
  }
}

 bool isMealFavorite(String id){
return favoriteMeal.any((meal) => meal.id==id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        canvasColor:const Color.fromRGBO(250,250, 222, 1),
        textTheme:  const TextTheme(
          bodyText1 : TextStyle(fontSize: 18,fontFamily:'Ubuntu',fontWeight: FontWeight.bold),
        )
      ),

      routes:{
      '/':(context) => TabsScreen(favoriteMeal),
        CategoryMealsScreen.routeName :(context) => CategoryMealsScreen(),
        MealDetailScreen.routeName :(context) => MealDetailScreen(togelfavorite,isMealFavorite),
     FilterScreen.routeName: (context) => FilterScreen(),

      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meal App'),
      ),
      body:CategoryScreen(),
    );
  }
}
