import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widget/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
/*this class show:
*   bottomNavigationBar:
*     Categories: class => CategoriesScreen()
*     Favorites: class => FavoritesScreen()
*   drawer: class => MainDrawer()
* */
class TabScreen extends StatefulWidget {
  // list of favorite meals
  final List<Meals> favoriteMeals;
  // construct for List favorite meals
  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  /*this list contain:
  *   Page: Scaffold class contain body without appBar
  *   title: is AppBar text for every page
  * */
  // list of map of which page user select
  List<Map<String, Object>> _page;

  // run as static method and take widget.
  void initState(){
    _page = [
      {
        'page':CategoriesScreen(),
        'title':'Category'
      },
      {
        'page':FavoritesScreen(widget.favoriteMeals),
        'title':'Favorites'
      }
    ];
    super.initState();
  }
  
  // this is index to control _page list
  int _selectedPageIndex = 0;
  /*this function set value to _selectedPageIndex
  * this when in click on BottomNavigationBarItem
  * index 0: Categories
  * index 1: Favorites*/
  void _selectPage(int value){
    setState(() {
      _selectedPageIndex = value;
    });
  }
  /*Widget Function Show:
  *   Scaffold (means screen):
  *     appBar
  *     bottomNavigationBar
  *     drawer
  **/
  @override
  Widget build(BuildContext context) {
    // screen
    return Scaffold(
      appBar: AppBar(
        // this appBar changed by index of _page list
        title: Text(_page[_selectedPageIndex]['title']),
      ),

      body: _page[_selectedPageIndex]['page'],
      /*bottomNavigationBar
      * is bar in screen bottom can show different pages when click on icon or text*/
      bottomNavigationBar: BottomNavigationBar(
        //when click on a icon like Categories or Favorites to do action
        onTap: _selectPage,
        // index of every BottomNavigationBar Item
        currentIndex: _selectedPageIndex,
        // color of all bar
        backgroundColor: Theme.of(context).primaryColor,
        // color of selected icon
        selectedItemColor: Theme.of(context).accentColor,
        // color of unselected icon
        unselectedItemColor: Colors.white,
        // list of items(icons)
        items: [
          // first item of category page
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          // item of favorite page
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
      // this show a drawer can contain different screens (MealScreen, FiltersScreen)
      drawer: MainDrawer(),
    );
  }
}
