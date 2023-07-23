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

var selectedIndex = 0;

void addFave(Meal meal) {
  final faveMeals = dummyMeals.where((meal) {
    return meal.id == meal.id;
  }).toList();
  faveMeals.add(meal);
}

class _TabsScreenState extends State<TabsScreen> {
  final screens = [
    const CategoriesScreen(),
    // MealsScreen(
    //   title: 'Favorites',
    //   meals: faveMeals,
    // )
  ];

  //* METHOD-----------------------------------
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void addFave(Meal myMeal) {
    final faveMeals = dummyMeals.where((meal) {
      return meal.id == myMeal.id;
    }).toList();
    faveMeals.add(myMeal);
  }
  //* -----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dynamic'),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
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