import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRestaurantsProvider = StateNotifierProvider<
    FavoriteRestaurantsNotifier, List<Map<String, dynamic>>>(
  (ref) => FavoriteRestaurantsNotifier(),
);

class FavoriteRestaurantsNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  FavoriteRestaurantsNotifier() : super([]);

  void addFavorite(Map<String, dynamic> restaurant) {
    state = [...state, restaurant]; // Adds a restaurant to the list
  }

  void removeFavorite(Map<String, dynamic> restaurant) {
    state = state
        .where((r) => r['name'] != restaurant['name'])
        .toList(); // Removes a restaurant
  }
}
