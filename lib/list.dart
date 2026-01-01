import 'package:flutter/material.dart';
import 'RestaurantCard.dart';

class RestaurantListView extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants;

  const RestaurantListView({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestauCard(
          hours: restaurant['hours'],
          description: restaurant['description'],
          name: restaurant['name'],
          address: restaurant['address'],
          number: restaurant['number'],
          rating: restaurant['rating'],
          reviews: restaurant['reviews'],
          image: restaurant['image'],
          menuImage: restaurant['menuImage'],
        );
      },
    );
  }
}
