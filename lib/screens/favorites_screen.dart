import 'package:flutter/material.dart';
import 'package:flutter_list3_1/widget/meal_item.dart';
import '../models/meals.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meals> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("You have no favorites"),
      );
    }else{
      return ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
