import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_statemanagement/providers/favorites_meal_provider.dart';
import 'package:meal_app_statemanagement/providers/filters_provider.dart';
import 'package:meal_app_statemanagement/screens/categories.dart';
import 'package:meal_app_statemanagement/screens/filter.dart';
import 'package:meal_app_statemanagement/screens/meals.dart';
import 'package:meal_app_statemanagement/widgets/side_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class BottomTabs extends ConsumerStatefulWidget {
  const BottomTabs({super.key});

  @override
  ConsumerState<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends ConsumerState<BottomTabs> {
  var currentTabIndex = 0;

  void _switchTabs(index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void _onIdentifier(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoriesScreen(
      filtersMeals: filteredMeals,
    );
    var activeScreenTitle = "Categories";
    if (currentTabIndex == 1) {
      final favMealsList = ref.watch(favoriteMealsProvider);
      activeScreen = MealsScreen(
        mealsList: favMealsList,
      );
      activeScreenTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: Text(activeScreenTitle),
      ),
      drawer: SideDrawer(onIdentifier: _onIdentifier),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _switchTabs,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: currentTabIndex == 0
                  ? const Icon(Icons.set_meal)
                  : const Icon(Icons.set_meal_outlined),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: currentTabIndex == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
