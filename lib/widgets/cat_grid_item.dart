import 'package:flutter/material.dart';

import '../models/meal_category.dart';

class CatGridItem extends StatelessWidget {
  const CatGridItem(
      {super.key,
      required this.mealCategory,
      required this.onSelectMealCategory});

  final MealCategory mealCategory;
  // final void Function(BuildContext context) onSelectMealCategory;
  final void Function() onSelectMealCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectMealCategory,
      // onTap: () => Navigator.pushNamed(context, MealsScreen.mealScreen),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                mealCategory.color.withOpacity(0.55),
                mealCategory.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          mealCategory.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
