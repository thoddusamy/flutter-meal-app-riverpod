import 'package:flutter/material.dart';
import 'package:meal_app_statemanagement/models/meal_model.dart';
import 'package:meal_app_statemanagement/screens/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.mealsList,
  });

  final String? title;
  final List<MealModel> mealsList;

  @override
  Widget build(BuildContext context) {
    final content = mealsList.isNotEmpty
        ? ListView.builder(
            itemCount: mealsList.length,
            itemBuilder: (ctx, i) => MealItem(
              meal: mealsList[i],
            ),
          )
        : const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Oops... Nothing found!",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 5),
                Text("Try selecting a different category."),
              ],
            ),
          );

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
