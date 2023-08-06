import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meal_provider.dart';

enum Filter { gluten, lactose, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gluten: false,
          Filter.lactose: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    // this method simply says default filter values = selected user value
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool val) {
    // filter state is managed here
    // this method is to update/manipulate the state above in an immutable way
    state = {
      // spreading the old map in a new map and changing a value
      // we are creating a new map with the old key value pairs and one new key
      ...state,
      filter: val
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

// I'm adding a new provider in this same file because it is related to this file
final filteredMealsProvider = Provider((ref) {
  final activeFilters = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);
  return meals.where((meal) {
    // I want to return a condition for whether a meal should be shown or not
    // my own idea was if the filter is set and the meal itself is true for gluten free then show that meal
    // udemy idea is if the filter is not set and the meal has a false value for gluten free then don't show that meal
    if (activeFilters[Filter.gluten]! && !meal.glutenFree) {
      return false; // this means if the filter is set and the meal has a false value for gluten free don't show it
    }
    if (activeFilters[Filter.lactose]! && !meal.lactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.vegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.vegan) {
      return false;
    }
    return true;
  }).toList();
});
