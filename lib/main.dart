import 'package:flutter/material.dart';

import './categories_screen.dart';
import './category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w700),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is => /
      routes: {
        '/': (ctx) => CategoriesScreen(),
        '/category-meals': (ctx) => CategoryMealsScreen()
      },
    );
  }
}


/**
 * Steps to add a navigation
 * 1 - Seperate your files into scaffold widgets
 * */ 
