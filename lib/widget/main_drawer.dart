import 'package:flutter/material.dart';
import 'package:flutter_list3_1/screens/about_us_screen.dart';
import '../screens/filters_screen.dart';
// this class for Drawer
class MainDrawer extends StatelessWidget {
  // this function create icon with text and take function
  Widget bulidListTile(String text, IconData icon, Function tapHandler) {
    // بيحط icon و تكست
    return ListTile(
      // take icon
      leading: Icon(
        icon,
        size: 26,
      ),
      // take text appear next to icon
      title: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      // take function to do action if click the list tile
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    // create Drawer and return it to drawer in TabsScreen Class
    return Drawer(

      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),

          // give space between two items
          SizedBox(
            height: 20,
          ),
          // method to build icon with text and take function for which page are selected
          bulidListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          bulidListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          bulidListTile('about us', Icons.email, () {
            Navigator.of(context).pushReplacementNamed(AboutUsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
