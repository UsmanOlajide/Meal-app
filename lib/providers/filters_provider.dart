import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { gluten, lactose, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.gluten: false,
          Filter.lactose: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    // this method simply says default filter values = selected user value
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool val) {
    // filter state is managed here
    // this method is to update/manipulate the state above in an immutable way
    state = {
      // spreading the old map in a new map and changing a value
      // we are creating a new map with the old key value pairs and one new key
      ...state,
      filter: val
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
