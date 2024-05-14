import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/screens/meal_detail_screen.dart';

import '../models/meal.dart';
class MealItem extends StatelessWidget {
final String id;
final String imageUrl;
final String title;
final int duration;
final Affordability affordability;
final Complexity complexity;


 MealItem({required this.id,required this.imageUrl, required this.title, required this.duration, required this.affordability, required this.complexity,});

String get complexityText {
switch(complexity){
  case(Complexity.Simple) : return 'Simple'; break;
  case(Complexity.Hard) : return 'Hard'; break;
  case(Complexity.Challenging) : return 'Challenging'; break;
  default : return 'Undefine'; break;
}
}
String get affordabilityText {
  switch(affordability){
    case(Affordability.Affordable) : return 'Affordable'; break;
    case(Affordability.Luxurious) : return 'Luxurious'; break;
    case(Affordability.Pricey) : return 'Pricey'; break;
    default : return 'Undefine'; break;
  }
}

 void selectmeal(BuildContext ctx){
  Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
  arguments: id,
  ).then((result) {
    if (result != null) {
    //  removeItem(result);
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        selectmeal(context);
        },
      child: Card(
   margin:const EdgeInsets.all(10),
        elevation: 5,
       shape:RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(15),
       ),
          child: Column(
         children: [
           Stack(
             children: [
               ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft:Radius.circular(15),
                   topRight:Radius.circular(15),
                 ),
                child: Image.network(imageUrl,fit: BoxFit.cover,height: 200,width: double.infinity,),
               ),
               Positioned(
                 bottom:0,
                 right: 20,
                 child: Container(
                  color:Colors.black26,
                   width: 220,
                   child: Padding(
                     padding: const EdgeInsets.only(bottom: 20,top: 20,left: 8),
                     child: Text(title,style:const TextStyle(color: Colors.white,fontSize: 15),
                       softWrap: true,
                       overflow: TextOverflow.fade,
                     ),
                   ),
                 ),
               )
             ],
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Row(
                   children: [
                   const  Icon(Icons.schedule),
                   const  SizedBox(width: 8,),
                     Text("$duration min"),
                   ],
                 ),
                 Row(
                   children: [
                     const  Icon(Icons.work),
                    const SizedBox(width: 8,),
                     Text(complexityText),

                   ],
                 ),
                 Row(
                   children: [
                     const  Icon(Icons.attach_money),
                     const SizedBox(width: 8,),
                     Text(affordabilityText),
                   ],
                 ),
               ],
             ),
           )
         ],
      ),
      ),
    );
  }
}
