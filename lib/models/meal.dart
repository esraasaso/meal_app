import 'package:flutter/material.dart';

enum Complexity{
  Simple,
  Hard,
  Challenging,
}
enum Affordability{
  Affordable,
  Pricey,
  Luxurious,
}

class Meal{
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isVegan;
  final bool  isVegetarian;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final List<String> ingredients;
Meal({
  required this.id,
  required this.title,
  required this.categories,
  required this.imageUrl,
  required this.steps,
  required this.duration,
  required this.isVegan,
  required this. isVegetarian,
  required this.isLactoseFree,
  required this.isGlutenFree,
  required this.affordability,
  required this.complexity,
  required this.ingredients});

}