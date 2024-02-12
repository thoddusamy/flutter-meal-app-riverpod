import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_statemanagement/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters"),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filters.glutenFree]!,
              onChanged: (value) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filters.glutenFree, value);
              },
              title: const Text(
                "Gluten-free",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes gluten-free meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (value) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filters.lactoseFree, value);
              },
              title: const Text(
                "Lactose-free",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes lactose-free meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegetarian]!,
              onChanged: (value) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filters.vegetarian, value);
              },
              title: const Text(
                "Vegetarian",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes vegetarian meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegan]!,
              onChanged: (value) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filters.vegan, value);
              },
              title: const Text(
                "Vegan",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes vegan meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ));
  }
}
