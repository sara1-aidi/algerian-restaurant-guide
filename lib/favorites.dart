import 'RestaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorites_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRestaurants = ref.watch(favoriteRestaurantsProvider);

    return Scaffold(
      body: favoriteRestaurants.isEmpty
          ? const Center(child: Text("No favorite restaurants yet."))
          : ListView.builder(
              itemCount: favoriteRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = favoriteRestaurants[index];
                return FavoriteRestaurantCard(
                  restaurant: restaurant,
                );
              },
            ),
    );
  }
}

class FavoriteRestaurantCard extends ConsumerWidget {
  final Map<String, dynamic> restaurant;

  const FavoriteRestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite =
        ref.watch(favoriteRestaurantsProvider).contains(restaurant);

    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                restaurant['image'],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant['name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 3.0),
                        Row(
                          children: [
                            const Icon(Icons.map_rounded,
                                size: 15.0, color: Colors.blue),
                            const SizedBox(width: 3.0),
                            Text(restaurant['address'],
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 3.0),
                        Row(
                          children: [
                            const Icon(Icons.phone,
                                size: 15.0, color: Colors.green),
                            const SizedBox(width: 3.0),
                            Text(restaurant['number'],
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 3.0),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 15.0, color: Color(0xFFFFEB3B)),
                            const SizedBox(width: 3.0),
                            Text(
                              "${restaurant['rating']}     (${restaurant['reviews']} reviews)",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red, // Red heart for liked
                        size: 30.0,
                      ),
                      onPressed: () {
                        ref
                            .read(favoriteRestaurantsProvider.notifier)
                            .removeFavorite(restaurant);

                        const snackBar = SnackBar(
                          content: Text("Removed from Favorites"),
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
