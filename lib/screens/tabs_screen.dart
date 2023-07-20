import 'package:flutter/material.dart';
// import 'package:meals_app/data/dummy_data.dart';
// import 'package:meals_app/screens/categories_scrn.dart';

// import 'package:meals_app/screens/meals_scrn.dart';
// import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

var selectedIndex = 0;

class _TabsScreenState extends State<TabsScreen> {
  //* METHOD--------------------
  void _selectScreen(int index) {
    selectedIndex = index;
  }

  //*---------------------------
  @override
  Widget build(BuildContext context) {
    // final favMealList = dummyMeals.where((element) => false)
    // Widget activeScreen = const CategoriesScreen();
    // if(selectedIndex == 1){
    //   activeScreen = MealsScreen(title:'Favorites' , meals: meals);
    // }
    // Meals screen requires a new list of meals which will be a list of favorite meals
    // How do I add a meal item to the list of favorite meals

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic')),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
