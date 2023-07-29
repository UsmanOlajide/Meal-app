import 'package:flutter/material.dart';

import 'package:meals_app/screens/categories_scrn.dart';
import 'package:meals_app/screens/filters_scrn.dart';

import 'package:meals_app/screens/meals_scrn.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

import '../models/meal.dart';

// import 'package:meals_app/screens/categories_scrn.dart';
// import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex = 0;
  final List<Meal> _faveMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleFave(Meal meal) {
    var isExisting = _faveMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _faveMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite ooo');
    } else {
      setState(() {
        _faveMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite');
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to clear existing snackbars
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    ));
  }

  void _onSelectScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) {
            return const FiltersScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      toggleFave: _toggleFave,
    );
    var activeScreenTitle = 'Categories';
    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(
        meals: _faveMeals,
        toggleFave: _toggleFave,
      );
      activeScreenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      drawer: DrawerWidget(onSelectScreen: _onSelectScreen),
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

    // Meals screen requires a new list of meals which will be a list of favorite meals
    // How do I add a meal item to the list of favorite meals