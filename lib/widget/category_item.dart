import 'package:flutter/material.dart';
import 'package:flutter_list3_1/screens/categorymealscreen.dart';

class CategoryItem extends StatelessWidget {
  // id, title color, of DUMMY_CATEGORIES(italian, german,...)
  final String id;
  final String title;
  final Color color;
  // constructor
  CategoryItem(this.id, this.title, this.color);

  //
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id':id,
        'title':title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return container for CategoryScreen
    return Container(
      // create items with clicking
      child: InkWell(
        // take method of select item
        onTap: () => selectCategory(context),

        borderRadius: BorderRadius.circular(20),
        child: Container(

          padding: EdgeInsets.all(15),
          // take title of DUMMY_CATEGORIES
          child:  Text(title, style: Theme.of(context).textTheme.title,),
          // decoration of Container
          decoration: BoxDecoration(
            // make opacity of colors or take some different colors
            gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color,],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // make container border circular
            borderRadius: BorderRadius.circular(20),
          ),
        ),

      ),
    );
  }
}
