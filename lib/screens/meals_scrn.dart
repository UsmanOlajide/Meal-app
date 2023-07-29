import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_scrn.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.toggleFave,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) toggleFave;
  // static const mealScreen = '/mealscreen';

  //* METHODS--------------------------------------------
  void selectMealItem(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return MealDetailScreen(
            meal: meal,
            toggleFave: toggleFave,
          );
        },
      ),
    );
  }
  //* ----------------------------------------------------

  // void selectMealItem(BuildContext context, Meal meal,  mealDetailList) {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
  //     return MealDetailScreen(meal: meal, mealDetailList: mealDetailList,);
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Text(
      'Nothing to show',
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ));

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(meals[index].title);
          return MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                selectMealItem(context, meal);
              });
        },
        itemCount: meals.length,
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
