import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            iconSize: 30,
            padding: EdgeInsets.only(right: 15),
            icon: Icon(Icons.star),
            onPressed: () {},
          ),
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
            SizedBox(height: 20),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            SizedBox(height: 25),
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