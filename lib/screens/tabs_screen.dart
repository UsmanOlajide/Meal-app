import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories_scrn.dart';

// import 'package:meals_app/screens/categories_scrn.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/screens/meals_scrn.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

void addFave(Meal meal) {
  final faveMeals = dummyMeals.where((meal) {
    return meal.id == meal.id;
  }).toList();
  faveMeals.add(meal);
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex = 0;
  final List<Meal> _faveMeals = [];
  //* METHOD-----------------------------------
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void tsoggleFave(Meal myMeal) {
    final faveMeals = dummyMeals.where((meal) {
      return meal.id == myMeal.id;
    }).toList();
    faveMeals.add(myMeal);
    //* This logic is to get a filtered list of meals where the id of the meal i am acting on is equal to the id of a meal, it wont work this way cos the list now depends on the method and there is no way to use that list, so the best way was to make that list available widely
    //* The new logic is now to check if a meal is already in the faveMeals list, if so then when i try toggle the button it should be removed from the list,
    //* But if the meal is not there already then it should be added
  }

  void toggleFave(Meal meal) {}
  //* -----------------------------------------

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      toggleFave: toggleFave,
    );
    var activeScreenTitle = 'Categories';

    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(
        meals: _faveMeals,
        toggleFave: toggleFave,
      );
      activeScreenTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('dynamic'),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}

    // Fav screen requires a new list of meals which will be a list of favorite meals
    // How do I add a meal item to the list of favorite meals