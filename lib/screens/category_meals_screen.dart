import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "'/category-meals'";
  final List<Meal> avaliableMeals;
  CategoryMealsScreen(this.avaliableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadInitDate = false;
  @override
  void initState() {
    // in init state you cant recieve the context object because the widget still dont added to the widgets tree
    // it runs before build runs

    super.initState();
  }

  @override
  void didChangeDependencies() {
    /*
      whenever the references of the state change, which also means it will be called when  
      the widget that belongs to the state has been fully initialized 
      and we can tap into context,this will still run before build runs 
    */
    if (_loadInitDate) return;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.avaliableMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    _loadInitDate = true;
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            // removeItem: removeMeal,
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
