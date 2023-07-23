import 'package:flutter/material.dart';
import 'package:meals_app/widgets/cat_grid_item.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import 'meals_scrn.dart';
import '../models/meal_category.dart';

// typedef filteredMeals =

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.toggleFave});
  final void Function(Meal meal) toggleFave;
  void selectCategory(BuildContext context, MealCategory mealCategory) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(mealCategory.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(
              title: mealCategory.title,
              meals: filteredMeals,
              toggleFave: toggleFave);
        },
      ),
    );

    //* Tried to use PushNamed but got stuck
    // Navigator.pushNamed(context, MealsScreen.mealScreen,
    //     arguments: [filteredMeals, mealCategory]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // ...availableCategories.map((category) {
        //   return CatGridItem(category: category);
        // })
        for (final mealCategory in availableCategories)
          CatGridItem(
            mealCategory: mealCategory,
            onSelectMealCategory: () => selectCategory(context, mealCategory),
          )
      ],
    );
  }
}
