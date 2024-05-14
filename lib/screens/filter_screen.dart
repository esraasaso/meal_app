import 'package:flutter/material.dart';
import '/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "filter";

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isVegetarian = false;
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Expanded(
            child: ListView(
              children: [

        SwitchListTile(
          title: const Text("Gluten free"),
            subtitle:const Text("food include only without gluten"),
            value: isGlutenFree, onChanged: (newValue){
         setState(() {
           isGlutenFree=newValue;
         });
        }),
                SwitchListTile(
                    title:const Text("Lactose Free"),
                    subtitle:const Text("food include only without lactose"),
                    value: isLactoseFree,
                    onChanged: (newValue){
                  setState(() {
                    isLactoseFree=newValue;
                  });
                }),

                SwitchListTile(
                    title:const Text("Vegetarian"),
                    subtitle:const Text("food include only Vegetarian"),
                    value: isVegetarian, onChanged: (newValue){
                  setState(() {
                    isVegetarian=newValue;
                  });
                }),

                SwitchListTile(
                    title:const Text("Vegan"),
                    subtitle:const Text("food include only Vegan"),
                    value: isVegan, onChanged: (newValue){
                  setState(() {
                    isVegan=newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
