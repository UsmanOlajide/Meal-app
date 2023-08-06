import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  // the provider approach is more useful if we have dynamic data and cross-widget state, but to get started we'll just use dummyMeals even though it's not required
  return dummyMeals;
});
