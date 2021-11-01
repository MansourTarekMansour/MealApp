import 'package:flutter/material.dart';
import 'package:flutter_list3_1/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';

  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(text, style: Theme
          .of(context)
          .textTheme
          .title,),
    );
  }

  Widget buildSectionSteps(child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 600,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    //screen
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
             // borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectMeal.imageUrl, fit: BoxFit.cover,),
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildSectionSteps(ListView.builder(
              itemBuilder: (_, index) =>
                  Card(
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text(selectMeal.ingredients[index]),
                    ),
                  ),
              itemCount: selectMeal.ingredients.length,

            )),
            buildSectionTitle(context, 'Steps'),
            buildSectionSteps(ListView.builder(
              itemBuilder: (_, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(selectMeal.steps[index]),
                  ),
                ],
              ),
              itemCount: selectMeal.steps.length,
            ),),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => toggleFavorite(mealId),
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
