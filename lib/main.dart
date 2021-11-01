/*
* Created By Dev Mansour Tarek Mansour
* Email: mansourtarek100@gmail.com
* Flutter course link: https://www.udemy.com/course/fluttercourse/
* Section 6: Meal Application
* Started Section 6 in Ramadan 2021
* */
import 'package:flutter/material.dart';
import 'package:flutter_list3_1/screens/about_us_screen.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categorymealscreen.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // take meals after filter
  List<Meals> _availableMeals = DUMMY_MEALS;
  //list of favorite meals that appear in Favorite Screen
  List<Meals> _favoriteMeals= [];

  // map of values of filter screen
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  // method to filter meals
  void _setFilters(Map<String, bool> _filterData){
    setState(() {
      _filters = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree) return false;
        if(_filters['lactose'] && !meal.isLactoseFree) return false;
        if(_filters['vegan'] && !meal.isVegan) return false;
        if(_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  // chick id of favorites meal and add it if not added and delete it if it found in list
  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  // chick id if found put star border and if not put star without border in MealDetailScreen class
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    // route of all app
    return MaterialApp(
      /*
      شريط بيظهر فوق اعلى الشاشه مكتوب عليه debug
      this take true of false
      */
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      /*
      theme for share colors around app
      take ThemeData
      */
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              title: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //home: MyAppHome(),
      /*initial route means first page in the app*/
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite , _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),
        AboutUsScreen.routeName: (context) => AboutUsScreen(),
      },
    );
  }
}