import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/model/meals.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealsFavouriteStatus(Meal meal) {
    final mealsIsFavourite = state.contains(meal);

    if (mealsIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];

      return true;
    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
