import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

import 'package:meals_app/providers/meal_provider.dart';

import 'package:meals_app/screens/categories_scrn.dart';
import 'package:meals_app/screens/filters_scrn.dart';

import 'package:meals_app/screens/meals_scrn.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var _selectedIndex = 0;

// METHODS-------------------------------------
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// This method controls what happens when I select a screen in the drawer
  void _onSelectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        // this contains the push to filters screen and the data I passed from it
        // I used await because the data I'm passing from Filters screen back here is returning a Future,
        // the return value is not available immediately
        // but at some point in the future when the user navigates back here
        MaterialPageRoute(
          builder: (ctx) {
            return const FiltersScreen();
          },
        ),
      );
    }
  }

// ----------------------------------------------
  @override
  Widget build(BuildContext context) {
    // Initializations----------------------------------------------
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activeScreenTitle = 'Categories';
    if (_selectedIndex == 1) {
      final faveMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealsScreen(
        meals: faveMeals,
      );
    }
    activeScreenTitle = 'Your Favorites';

//-----------------------------------------------------------------
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

//* I want to make sure to pass the updated list of available meals
//* based on the selected filters to categories screen
//* METHOD 1
//* - Add a new variable to store the selected filters, they will have an initial value of false ✅
//*   These initial values should now be updated whenever
//*    I receive new info from the filters screen (when a filter is set)

//* Twisted View on the if statement in onSelectScreen method
//* Maybe what we are passing an initial Map<Filter,bool> from tabsScreen to filtersScreen
//* When filterScreen is pressed the filters in tabScreen should now be equal to the filters in filtersScreen

//* WHAT I HAVE DONE SO FAR
//* - Pass filters from filters screen to tabs screen
//* - Created a Map<Filter, bool> called selectedFilters in tabs screen then equated it to the one in filters screen
//* - Created a list of available meals that handles the logic of which meal to show depending on each filter
//* - Passed and Used that list in categories screen
//* - How did I use it, i used available means in the filtered meals instead of just ordinary dummy meals cos at the end of the day if no filters are set the available meals returns all the meals just like what dummyMeals would do, this way i save time and avoid code duplication and shii
//* - I want to pass the filter data to the categories screen
//* - ✅ We can pass a list of available meals to categories screen which can then be used picked up and used inside it

//* - WHAT I JUST WANT TO DO
//* - When I set filters in filter screen and I leave, I want to save the filters I set
//* so that when I go back to filters screen I can still see the filters I set
//* That means in filters screen instead of setting the default value to false, it should be based on what i selected

//* - My own thought process was
//* - Pass the selected filters from filters screen to tabsscreen
//* - Then pass it to the categories screen do the logic
//* -
//* -

//* My question is why am i creating selected filters in tabsscreen and not in filtersscreen
