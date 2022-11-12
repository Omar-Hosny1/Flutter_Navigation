import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("No Items Yet"),
      );
    }
    return ListView.builder(
      itemBuilder: ((context, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
          duration: favoriteMeals[index].duration,
        );
      }),
      itemCount: favoriteMeals.length,
    );
  }
}
