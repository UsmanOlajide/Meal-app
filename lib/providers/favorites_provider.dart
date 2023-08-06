import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Tudo - Add the initial value which will be an empty list
  FavoriteMealsNotifier() : super([]);
  // Tudo - Add the methods that will change that list
  bool toggleFaveMeal(Meal meal) {
    final mealIsFave = state.contains(meal);
    if (mealIsFave) {
      // return a new list if a meal id is not == to the current meal id
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  } // state = List<Meal> state
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier()); // optimized for data that can change
// final favoriteMealsProvider = Provider();
// The basic Provider() class is great for when you have static data that never changes like in mealsprovider














//* The idea here is to build a provider to 
//* simply store all these favorite meals in a list of favorite meals