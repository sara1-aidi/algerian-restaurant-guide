import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorites_provider.dart';
import 'detail.dart';

List<Map<String, dynamic>> favoriteRestaurants = [];

class RestauCard extends StatelessWidget {
  final String name;
  final String address;
  final String number;
  final double rating;
  final int reviews;
  final String image;
  final String menuImage;
  final String hours;
  final String description;

  const RestauCard({
    super.key,
    required this.name,
    required this.address,
    required this.number,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.menuImage,
    required this.hours,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the RestaurantDetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailScreen(
              restaurant: {
                'name': name,
                'address': address,
                'number': number,
                'rating': rating,
                'reviews': reviews,
                'image': image,
                'hours': hours,
                'description': description,
                'menuImage': menuImage
              },
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Container(
          height: 90,
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  image,
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
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            children: [
                              const Icon(Icons.map_rounded,
                                  size: 15.0, color: Colors.blue),
                              const SizedBox(width: 3.0),
                              Text(address,
                                  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  size: 15.0, color: Colors.green),
                              const SizedBox(width: 3.0),
                              Text(number,
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
                                "$rating     ($reviews reviews)",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      FavoriteButton(restaurant: {
                        'name': name,
                        'address': address,
                        'number': number,
                        'rating': rating,
                        'reviews': reviews,
                        'image': image,
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends ConsumerWidget {
  final Map<String, dynamic> restaurant;

  const FavoriteButton({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite =
        ref.watch(favoriteRestaurantsProvider).contains(restaurant);

    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
        size: 30.0,
      ),
      onPressed: () {
        if (isFavorite) {
          ref
              .read(favoriteRestaurantsProvider.notifier)
              .removeFavorite(restaurant);
        } else {
          ref
              .read(favoriteRestaurantsProvider.notifier)
              .addFavorite(restaurant);
        }

        final snackBar = SnackBar(
          content: Text(
            isFavorite ? "Removed from Favorites" : "Added to Favorites",
          ),
          duration: const Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
