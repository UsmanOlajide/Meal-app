import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

import '../models/meal.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,

    // required this.faveMeals,
  });

  final Meal meal;

  // final List<Meal> faveMeals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faveMeals = ref.watch(favoriteMealsProvider);

    final isFave = faveMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleFaveMeal(meal);
                ScaffoldMessenger.of(context)
                    .clearSnackBars(); // to clear existing snackbars
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      wasAdded ? 'Marked as favorite' : 'No longer a favorite'),
                  behavior: SnackBarBehavior.floating,
                ));
              },
              icon: Icon(
                isFave ? Icons.star : Icons.star_border,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 25),
            Text(
              'Steps',
              textAlign: TextAlign.center,
              softWrap: true,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),

            //* It's either i use map on the list or loop through each element in the list
            // ...meal.ingredients.map((e) => Text(
            //       e,
            //       style: TextStyle(color: Colors.white),
            //     ))
          ],
        ),
      ),
    );
  }

  // body: ListView.builder(
  //   itemBuilder: (context, index) {
  //     return Text('LIST OF INGREDIENTS');
  //   },
  //   itemCount: mealDetailList.length,
  // ),
}

// Center(
//         child: Column(
//           children: [
//             Text(
//               'LIST OF INGREDIENTS',
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             ),
//           ],
//         ),
//       ),