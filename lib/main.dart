import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs_screen.dart';

// import 'models/meal.dart';
// import 'screens/categories_scrn.dart';
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
