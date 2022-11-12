import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text("${selectedMeal.title}")),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, "Ingredients"),
          buildContainer(
            ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      )),
                );
              },
            ),
          ),
          buildSectionTitle(context, "Steps"),
          buildContainer(ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text("# ${index + 1}")),
                title: Text(selectedMeal.steps[index]),
              );
            },
          ))
        ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   onPressed: () {
      //     var nav = Navigator.of(context);
      //     if (nav.canPop()) {
      //       nav.pop(mealId);
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child:
            isMealFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
