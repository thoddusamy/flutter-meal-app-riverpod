import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_statemanagement/models/meal_model.dart';
import 'package:meal_app_statemanagement/providers/favorites_meal_provider.dart';

class MealItemDetails extends ConsumerWidget {
  const MealItemDetails({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMealsList = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded =
                  ref.read(favoriteMealsProvider.notifier).toggleFavMeals(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text(isAdded
                      ? "Meals added to Favorites"
                      : "Meals removed from Favorites"),
                ),
              );
            },
            icon: favoriteMealsList.contains(meal)
                ? Icon(
                    Icons.favorite,
                    color: Colors.redAccent[400],
                  )
                : const Icon(Icons.favorite_border),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(height: 20),
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 22, color: Colors.pink),
            ),
            const SizedBox(height: 7),
            for (final ingredient in meal.ingredients) Text(ingredient),
            const SizedBox(height: 25),
            const Text(
              "Steps",
              style: TextStyle(fontSize: 22, color: Colors.pink),
            ),
            const SizedBox(height: 7),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(step),
              ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
