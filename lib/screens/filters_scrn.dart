import 'package:flutter/material.dart';

enum Filter { gluten, lactose, vegetarin, vegan }

enum NewFilter { gluten, lactose, vegetarin, vegan, sleep }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  //---------------------------
  var glutenValue = false;
  var lactoseValue = false;
  var vegetarianValue = false;
  var veganValue = false;
//----------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) {
      //           return const TabsScreen();
      //         },
      //       ),
      //     );
      //   }
      // }),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gluten: glutenValue,
            Filter.lactose: lactoseValue,
            Filter.vegetarin: vegetarianValue,
            Filter.vegan: veganValue,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenValue,
              onChanged: (isSwitched) {
                setState(() {
                  glutenValue = isSwitched;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactoseValue,
              onChanged: (isSwitched) {
                setState(() {
                  lactoseValue = isSwitched;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegetarianValue,
              onChanged: (isSwitched) {
                setState(() {
                  vegetarianValue = isSwitched;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganValue,
              onChanged: (isSwitched) {
                setState(() {
                  veganValue = isSwitched;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class FiltersScreen extends StatefulWidget {
//   const FiltersScreen({super.key});

//   @override
//   State<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends State<FiltersScreen> {
//   var firstValue = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Filters'),
//       ),
//       body: Column(
//         children: [
//           SwitchListTile(
//             value: firstValue,
//             onChanged: (isSwitched) {
//               setState(() {
//                 firstValue = isSwitched;
//               });
//             },
//             title: Text(
//               'Gluten-Free',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

