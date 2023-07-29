// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum Complexity {
  simple,
  challenging,
  hard,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.glutenFree,
    required this.vegan,
    required this.vegetarian,
    required this.lactoseFree,
  });

  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool glutenFree;
  final bool vegan;
  final bool vegetarian;
  final bool lactoseFree;
}
