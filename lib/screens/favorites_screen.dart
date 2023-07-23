// import 'package:flutter/material.dart';

// import '../models/meal.dart';
// import '../widgets/meal_item.dart';
// import 'meal_detail_scrn.dart';

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key, required this.faveMeals});
//   void selectMealItem(BuildContext context, Meal meal) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) {
//           return MealDetailScreen(
//             meal: meal,
//           );
//         },
//       ),
//     );
//   }

//   final List<Meal> faveMeals;
//   @override
//   Widget build(BuildContext context) {
//     return faveMeals.isEmpty
//         ? Center(
//             child: Text(
//             'Nothing to show',
//             style: Theme.of(context)
//                 .textTheme
//                 .titleLarge!
//                 .copyWith(color: Theme.of(context).colorScheme.onBackground),
//           ))
//         : ListView.builder(
//             itemBuilder: (ctx, index) {
//               // return Text(meals[index].title);
//               return MealItem(
//                   meal: faveMeals[index],
//                   onSelectMeal: (meal) {
//                     selectMealItem(context, meal);
//                   });
//             },
//             itemCount: faveMeals.length,
//           );
//   }
// }
