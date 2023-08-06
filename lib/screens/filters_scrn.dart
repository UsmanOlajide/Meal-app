import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.gluten]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gluten, isSwitched);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Gluten-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactose]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactose, isSwitched);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Lactose-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isSwitched);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include Vegetarian meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isSwitched) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isSwitched);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}

//* Main Goal
//* I don't want to manage state in here
//* TODO
//* Instead of updating local state here when a switch is pressed (setState) I could update that filter
//* in the provider and then re-render the UI to reflect those changes on the switch


//* I got rid of these functionalities
//* Giving the filters a default value of false
//* Setting the default filters to the filters selected using initState
//* Popping and passing the filters selected to the tabsScreen
//* setState of the default filter to be equal to selected filter true/false



// CODE BEFORE IMPLEMENTING STATE MANAGEMENT
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:meals_app/providers/filters_provider.dart';

// class FiltersScreen extends ConsumerStatefulWidget {
//   const FiltersScreen({super.key});

//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   //---------------------------
//   var glutenValue = false;
//   var lactoseValue = false;
//   var vegetarianValue = false;
//   var veganValue = false;
// //----------------------------
//   @override
//   void initState() {
//     // I'm using init state because i cannot use widget.currentFilters in the initialization
//     super.initState();
//     //this logic is to show the set filters if we go back to the filtersscreen
//     var activeFilters = ref.read(filtersProvider);
//     // initState runs only once so it is better to use read instead of watch to listen for future changes and we have no need for that
//     glutenValue = activeFilters[Filter.gluten]!;
//     lactoseValue = activeFilters[Filter.lactose]!;
//     vegetarianValue = activeFilters[Filter.vegetarian]!;
//     veganValue = activeFilters[Filter.vegan]!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // drawer: DrawerWidget(onSelectScreen: (identifier) {
//       //   Navigator.of(context).pop();
//       //   if (identifier == 'Meals') {
//       //     Navigator.of(context).pushReplacement(
//       //       MaterialPageRoute(
//       //         builder: (ctx) {
//       //           return const TabsScreen();
//       //         },
//       //       ),
//       //     );
//       //   }
//       // }),
//       appBar: AppBar(
//         title: const Text('Your Filters'),
//       ),
//       body: WillPopScope(
//         onWillPop: () async {
//           ref.read(filtersProvider.notifier).setFilters({
//             Filter.gluten: glutenValue,
//             Filter.lactose: lactoseValue,
//             Filter.vegetarian: vegetarianValue,
//             Filter.vegan: veganValue,
//           });
//           return true;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: glutenValue,
//               onChanged: (isSwitched) {
//                 setState(() {
//                   glutenValue = isSwitched;
//                 });
//               },
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include Gluten-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: lactoseValue,
//               onChanged: (isSwitched) {
//                 setState(() {
//                   lactoseValue = isSwitched;
//                 });
//               },
//               title: Text(
//                 'Lactose-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include Lactose-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: vegetarianValue,
//               onChanged: (isSwitched) {
//                 setState(() {
//                   vegetarianValue = isSwitched;
//                 });
//               },
//               title: Text(
//                 'Vegetarian',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include Vegetarian meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: veganValue,
//               onChanged: (isSwitched) {
//                 setState(() {
//                   veganValue = isSwitched;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text(
//                 'Only include vegan meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //* Main Goal
// //* I don't want to manage state in here
// //* TODO
// //* Instead of updating local state here when a switch is pressed (setState) I could update that filter
// //* in the provider and then re-render the UI to reflect those changes on the switch