import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = 'meal detail';
 final Function  togelfavorite;
final Function isMealFavorite;
  const MealDetailScreen( this.togelfavorite,this.isMealFavorite);
  Widget sectionText(BuildContext ctx, String text) {
    return Text(
      text,
      style: Theme.of(ctx).textTheme.bodyText1,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)?.settings.arguments as String;
    final selectid = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);

    Widget sectionContainer(child) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 200,
          height:200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.orange),
            color: Colors.white,
          ),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectid.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectid.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: sectionText(context, 'ingredients'),
            ),
            sectionContainer(
              ListView.builder(
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      selectid.ingredients[index],
                    ),
                  ),
                ),
              );
            },
            itemCount: selectid.ingredients.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            sectionText(context, 'Steps'),
            sectionContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(selectid.steps[index]),
                          leading: Text('- ${index+1}',style: const TextStyle(color: Colors.orange),),
                        ),
                    const Divider(),  ],
                    ),
                  );
                },
                itemCount: selectid.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>togelfavorite(mealid),
        child: Icon(
            isMealFavorite(mealid)? Icons.star:Icons.star_border
        ),
      ),
    );
  }
}
