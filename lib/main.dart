import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs_screen.dart';

// import 'models/meal.dart';
// import '../models/meal.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 131, 57, 0),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      home: const TabsScreen(),
      // routes: {
      //   MealsScreen.mealScreen: (context) => MealsScreen(
      //         title: 'Some Category',
      //         meals: dummyMeals,
      //       )
      // },
    );
  }
}


//Add a side drawer that allows us to switch to a filters page
//* PROBLEM
//* M-GOAL : When I switch a filter-on I want the meals that will appear when i tap on a category to only be the meals that are in that category I switched on 
//* I am going to be working with :
//* -filters screen
//* -meals screen
//* 
//* In the filters screen
//* ----When a switch is on, it should stay that way even when I leave that screen and go back to it
//* 
//* 