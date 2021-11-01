import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../models/meals.dart';

class CategoryMealScreen extends StatefulWidget {
  // route name of the class
  static const routeName = 'category_screen';
  // meals after filter
  final List<Meals> availableMeals;
  // constructor
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  // list of meals that will display
  List<Meals> displayedMeal;

  // static Function
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // map of title, id that toke form CategoryItem navigator arguments
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    //  id of category
    final categoryId = routeArg['id'];
    // title (italian, Asian,...)
    categoryTitle = routeArg['title'];
    // list of meals that found by id of Category item
    displayedMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  /*void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    // screen
    return Scaffold(
      // take title if DUMMY_CATEGORY
      appBar: AppBar(
        title: Text(categoryTitle),
      ),

      body: Center(
        widthFactor: double.infinity,
        child: Container(
          width: 600,
          // list with scrolling
          child: ListView.builder(
            itemBuilder: (_, index) {
              return MealItem(
                id: displayedMeal[index].id,
                title: displayedMeal[index].title,
                imageUrl: displayedMeal[index].imageUrl,
                complexity: displayedMeal[index].complexity,
                duration: displayedMeal[index].duration,
                affordability: displayedMeal[index].affordability,
                //removeItem: _removeMeal,
              );
            },
            itemCount: displayedMeal.length,
          ),
        ),
      ),
    );
  }
}
