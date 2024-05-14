import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/main_drawer.dart';
import './category_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
 TabsScreen(this.favoriteMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String,dynamic>> pages;
  int page_index=0;
  @override
  void initState() {
   pages =[
    {'page' : const CategoryScreen(),
    'title' : 'Categories',},
    {
    'page' :FavoriteScreen(widget.favoriteMeal),
    'title' : 'Your Favorites',
    }
    ];
    super.initState();
  }
  void selectPage(int value){
setState(() {
  page_index = value;
});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text(pages[page_index]['title'].toString()),),
      body:pages[page_index]['page'],
      bottomNavigationBar: BottomNavigationBar(

        onTap:selectPage,
backgroundColor:Colors.orange,
        selectedItemColor:Colors.white,
        unselectedItemColor: Colors.deepOrange,
        currentIndex: page_index,
        items:const [
          BottomNavigationBarItem(icon:Icon(Icons.category),
          label:  "Categories"
          ),

          BottomNavigationBarItem(icon: Icon(Icons.favorite),
        label:  "Favorites"
          ),
        ],
      ),
   drawer:MainDrawer(), );
  }
}
