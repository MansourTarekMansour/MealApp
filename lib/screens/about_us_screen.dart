import 'package:flutter/material.dart';
import 'package:flutter_list3_1/widget/main_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  static const String routeName = "about_us_screen";

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(15),
                width: 300,
                height: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(500)),
                  child: Image.asset(
                    "assets/images/mansour.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Developer",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Center(
              child: Text(
                "Eng: Mansour Tarek Mansour",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Center(
              child: Text(
                "Mail",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Center(
              child: Text(
                "mansourtarek100@gmail.com",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
