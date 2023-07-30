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
//* MAIN BRANCH

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

//* MAIN GOAL IN THIS NEW BRANCH
//* The idea is to find a way to pass the data I use in Filters screen onto Meals screen
//*
//* STRATEGY 1 ❌
//* - Create a button in the appbar of Filters screen that pops back to the tabscreen ✅
//* - Then I pass the data I want to use in the arg of the pop
//*
//* STRATEGY 2
//* - Create conditional statements
//* - So that will mean if glutenfree is switched on, for each category the meal to be shown will depend on that switch
//*
//*
//* UDEMY STRATEGY
//* - Wrap the top widget in the body of Filters screen with WillPopScope 
//* and in the onWillPop function body I create a map 
//* and a key will refer to the bool values created earlier
//*
//*
//*  NEW GOAL - APPLYING FILTERS
//*  
//*  STRATEGY 1
//*  - Pass the updated meals based on the filters set to the categories screen
//*  - In the categories screen we then need to pass the filtered meals based on the filters set down to the meals screen 
//*  
//*  
//*  