import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_scrn.dart';
import 'package:meals_app/screens/favorites_screen.dart';
// import 'package:meals_app/screens/categories_scrn.dart';
// import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

var selectedIndex = 0;
var selectedIndexx = 0;
final screens = [
  const CategoriesScreen(),
  const FavoritesScreen(),
];

class _TabsScreenState extends State<TabsScreen> {
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

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
