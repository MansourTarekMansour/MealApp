import 'package:flutter/material.dart';
import 'package:flutter_list3_1/dummy_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // screen
    return Scaffold(
      // GridView create items next to each other
      body: GridView(
        // take widget list of CategoryItem
        // DUMMY_CATEGORIES List of kind of Meals(italian, german,...)
        children: DUMMY_CATEGORIES.map((catData) =>
            CategoryItem(catData.id, catData.title, catData.color),
        ).toList(),
        padding: EdgeInsets.all(20),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //the maximum extent of tiles in cross(x) axis
          // نسبه العرض لمحور x
          maxCrossAxisExtent: 200,
          // نسبه محور y
          //mainAxisExtent: 200,
          //the ratio of cross(x) axis to the main (y) axis
          childAspectRatio: 3/2,
          // space between two children along cross محور(X)
          crossAxisSpacing: 20,
          // space between two children along main axis محور(Y)
          mainAxisSpacing: 20,
          // مدي كل بلاطه
          //mainAxisExtent: ,
        ),
      ),
    );
  }
}
