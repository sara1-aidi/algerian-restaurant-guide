import 'package:flutter/material.dart';
import 'RestaurantCard.dart';
import 'detail.dart';

class RestaurantSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> cities;

  RestaurantSearchDelegate({required this.cities});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchResults = _searchRestaurants(query);

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final restaurant = searchResults[index];
        return GestureDetector(
          // or InkWell, similar to your RestauCard
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetailScreen(
                  restaurant: {
                    'name': restaurant['name'],
                    'address': restaurant['address'],
                    'number':
                        restaurant['number'], // Ensure this exists in your data
                    'rating':
                        restaurant['rating'], // Ensure this exists in your data
                    'eviews': restaurant[
                        'reviews'], // Ensure this exists in your data
                    'image': restaurant['image'],
                    'hours':
                        restaurant['hours'], // Ensure this exists in your data
                    'description': restaurant[
                        'description'], // Ensure this exists in your data
                    'enuImage': restaurant[
                        'menuImage'], // Ensure this exists in your data
                  },
                ),
              ),
            );
          },
          child: RestauCard(
            name: restaurant['name'],
            address: restaurant['address'],
            number: restaurant['number'] ?? '', // Provide defaults if not sure
            rating: restaurant['rating'] ?? 0.0,
            reviews: restaurant['reviews'] ?? 0,
            image: restaurant['image'],
            menuImage:
                restaurant['menuImage'] ?? '', // Provide defaults if not sure
            hours: restaurant['hours'] ?? '',
            description: restaurant['description'] ?? '',
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionResults = _searchRestaurants(query);

    return ListView.builder(
      itemCount: suggestionResults.length,
      itemBuilder: (context, index) {
        final restaurant = suggestionResults[index];
        return GestureDetector(
          // or InkWell
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetailScreen(
                  restaurant: {
                    'name': restaurant['name'],
                    'address': restaurant['address'],
                    'number': restaurant['number'],
                    'rating': restaurant['rating'],
                    'eviews': restaurant['reviews'],
                    'image': restaurant['image'],
                    'hours': restaurant['hours'],
                    'description': restaurant['description'],
                    'enuImage': restaurant['menuImage'],
                  },
                ),
              ),
            );
          },
          child: RestauCard(
            name: restaurant['name'],
            address: restaurant['address'],
            number: restaurant['number'] ?? '',
            rating: restaurant['rating'] ?? 0.0,
            reviews: restaurant['reviews'] ?? 0,
            image: restaurant['image'],
            menuImage: restaurant['menuImage'] ?? '',
            hours: restaurant['hours'] ?? '',
            description: restaurant['description'] ?? '',
          ),
        );
      },
    );
  }

  // Helper method to search for restaurants based on the query
  List<Map<String, dynamic>> _searchRestaurants(String query) {
    final results = <Map<String, dynamic>>[];

    // Loop through all cities, categories, and restaurants to find matches
    for (var city in cities) {
      for (var category in city['categories']) {
        for (var restaurant in category['restaurantList']) {
          if (restaurant['name'].toLowerCase().contains(query.toLowerCase())) {
            results.add(restaurant); // Add matching restaurant to results
          }
        }
      }
    }

    return results;
  }
}
