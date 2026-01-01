import 'package:flutter/material.dart';
import 'city_card.dart';
import 'category_list.dart';
import 'search.dart'; // Import the search delegate

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> cities = [
    {
      'cityName': 'CONSTANTINE',
      'imageUrl': 'images/constantine.jpg',
      'categories': [
        {
          'name': 'Traditional',
          'headerImage': 'images/traditionalheader.jpg',
          'restaurantList': [
            {
              'name': 'Dar El Bey',
              'address': 'EL Khroub',
              'number': '+213 123456789',
              'rating': 4.7,
              'reviews': 25,
              'image': 'images/traditional2.jpg',
              'hours': '10am-11pm',
              'description': 'Delicious traditional meals in Constantine.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'EL Khayma',
              'address': 'nouvelle ville',
              'number': '+213 123456789',
              'rating': 4.1,
              'reviews': 12,
              'image': 'images/traditional.jpg',
              'hours': '10am-11pm',
              'description': 'We make Homa Food.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
        {
          'name': 'Fast Food',
          'headerImage': 'images/fastfoodheader.jpg',
          'restaurantList': [
            {
              'name': 'Mega food',
              'address': 'nouvelle ville',
              'number': '+213 987654321',
              'rating': 3.7,
              'reviews': 15,
              'image': 'images/mumo.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Constantine.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'Burger king',
              'address': 'bousouf',
              'number': '+213 987654321',
              'rating': 4.3,
              'reviews': 35,
              'image': 'images/burger2.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Constantine.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
        {
          'name': 'Seafood',
          'headerImage': 'images/seafood.jpg',
          'restaurantList': [
            {
              'name': 'Seafood Corner',
              'address': 'belle vue',
              'number': '+213 112233445',
              'rating': 4.5,
              'reviews': 40,
              'image': 'images/fish.jpg',
              'hours': '10am-11pm',
              'description': 'Fresh seafood from the Mediterranean.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'Fish it',
              'address': 'belle vue',
              'number': '+213 112233445',
              'rating': 4.1,
              'reviews': 12,
              'image': 'images/fish3.jpg',
              'hours': '10am-11pm',
              'description': 'Fresh seafood from the Mediterranean.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
        {
          'name': 'Cafes',
          'headerImage': 'images/cafeheader.jpg',
          'restaurantList': [
            {
              'name': 'Café & crepes',
              'address': '123 nedjma',
              'number': '+213 998877665',
              'rating': 4.8,
              'reviews': 50,
              'image': 'images/cafe1.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café for coffee and pastries.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'pink cafe',
              'address': '123 nedjma',
              'number': '+213 998877665',
              'rating': 4.2,
              'reviews': 50,
              'image': 'images/cafe4.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café for coffee and pastries.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'halla cafe',
              'address': '123 nedjma',
              'number': '+213 998877665',
              'rating': 3.2,
              'reviews': 15,
              'image': 'images/cafe5.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café for coffee and pastries.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
      ],
    },
    {
      'cityName': 'ORAN',
      'imageUrl': 'images/oran.jpg',
      'categories': [
        {
          'name': 'Traditional',
          'headerImage': 'images/traditionalheader.jpg',
          'restaurantList': [
            {
              'name': 'Dar El Bey',
              'address': 'EL Khroub',
              'number': '+213 123456789',
              'rating': 4.7,
              'reviews': 25,
              'image': 'images/traditional2.jpg',
              'hours': '10am-11pm',
              'description': 'Delicious traditional meals in Constantine.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'EL Khayma',
              'address': 'nouvelle ville',
              'number': '+213 123456789',
              'rating': 4.1,
              'reviews': 12,
              'image': 'images/traditional.jpg',
              'hours': '10am-11pm',
              'description': 'We make Homa Food.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
        {
          'name': 'Fast Food',
          'headerImage': 'images/fastfoodheader.jpg',
          'restaurantList': [
            {
              'name': 'Mega food',
              'address': 'nouvelle ville',
              'number': '+213 987654321',
              'rating': 3.7,
              'reviews': 15,
              'image': 'images/mumo.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Constantine.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'Burger king',
              'address': 'bousouf',
              'number': '+213 987654321',
              'rating': 4.3,
              'reviews': 35,
              'image': 'images/burger2.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Constantine.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
        {
          'name': 'Seafood',
          'headerImage': 'images/seafood.jpg',
          'restaurantList': [
            {
              'name': 'Seafood Corner',
              'address': 'belle vue',
              'number': '+213 112233445',
              'rating': 4.5,
              'reviews': 40,
              'image': 'images/fish.jpg',
              'hours': '10am-11pm',
              'description': 'Fresh seafood from the Mediterranean.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'Fish it',
              'address': 'belle vue',
              'number': '+213 112233445',
              'rating': 4.1,
              'reviews': 12,
              'image': 'images/fish3.jpg',
              'hours': '10am-11pm',
              'description': 'Fresh seafood from the Mediterranean.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
        {
          'name': 'Cafes',
          'headerImage': 'images/cafeheader.jpg',
          'restaurantList': [
            {
              'name': 'Café & crepes',
              'address': '123 nedjma',
              'number': '+213 998877665',
              'rating': 4.8,
              'reviews': 50,
              'image': 'images/cafe1.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café for coffee and pastries.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'pink cafe',
              'address': '123 nedjma',
              'number': '+213 998877665',
              'rating': 4.2,
              'reviews': 50,
              'image': 'images/cafe4.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café for coffee and pastries.',
              'menuImage': 'images/constantine_menu.png'
            },
            {
              'name': 'halla cafe',
              'address': '123 nedjma',
              'number': '+213 998877665',
              'rating': 3.2,
              'reviews': 15,
              'image': 'images/cafe5.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café for coffee and pastries.',
              'menuImage': 'images/constantine_menu.png'
            },
          ],
        },
      ],
    },
    {
      'cityName': 'SETIF',
      'imageUrl': 'images/setif.jpg',
      'categories': [
        {
          'name': 'Traditional',
          'headerImage': 'https://example.com/setif_traditional.jpg',
          'restaurantList': [
            {
              'name': 'Setif Traditional Dishes',
              'address': '55 Traditional Avenue',
              'number': '+213 333444555',
              'rating': 4.8,
              'reviews': 50,
              'image': 'images/setif_traditional.jpg',
              'hours': '10am-11pm',
              'description': 'Traditional meals in Setif.',
              'menuImage': 'images/setif_menu.png'
            },
          ],
        },
        {
          'name': 'Fast Food',
          'headerImage': 'https://example.com/setif_fastfood.jpg',
          'restaurantList': [
            {
              'name': 'Setif Burger Express',
              'address': '789 Burger Street',
              'number': '+213 667788990',
              'rating': 4.2,
              'reviews': 20,
              'image': 'images/setif_burger.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Setif.',
              'menuImage': 'images/setif_menu.png'
            },
          ],
        },
        {
          'name': 'Seafood',
          'headerImage': 'https://example.com/setif_seafood.jpg',
          'restaurantList': [
            {
              'name': 'Setif Seafood House',
              'address': '123 Seaside Boulevard',
              'number': '+213 112233667',
              'rating': 4.4,
              'reviews': 15,
              'image': 'images/setif_seafood.jpg',
              'hours': '10am-11pm',
              'description': 'Best seafood in Setif.',
              'menuImage': 'images/setif_menu.png'
            },
          ],
        },
        {
          'name': 'Cafes',
          'headerImage': 'https://example.com/setif_cafe.jpg',
          'restaurantList': [
            {
              'name': 'Setif Café Delight',
              'address': '56 Coffee Square',
              'number': '+213 223344556',
              'rating': 4.5,
              'reviews': 45,
              'image': 'images/setif_cafe.jpg',
              'hours': '8am-10pm',
              'description': 'Relaxing café in Setif.',
              'menuImage': 'images/setif_menu.png'
            },
          ],
        },
      ],
    },
    {
      'cityName': 'ALGER',
      'imageUrl': 'images/alger.jpg',
      'categories': [
        {
          'name': 'Traditional',
          'headerImage': 'https://example.com/alger_traditional.jpg',
          'restaurantList': [
            {
              'name': 'Algerian Home Dishes',
              'address': '35 Algerian Street',
              'number': '+213 443322110',
              'rating': 4.6,
              'reviews': 30,
              'image': 'images/alger_traditional.jpg',
              'hours': '10am-11pm',
              'description': 'Authentic Algerian meals.',
              'menuImage': 'images/alger_menu.png'
            },
          ],
        },
        {
          'name': 'Fast Food',
          'headerImage': 'https://example.com/alger_fastfood.jpg',
          'restaurantList': [
            {
              'name': 'Alger Fast Food Corner',
              'address': '123 Fast Lane',
              'number': '+213 998877665',
              'rating': 4.2,
              'reviews': 40,
              'image': 'images/alger_burger.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Alger.',
              'menuImage': 'images/alger_menu.png'
            },
          ],
        },
        {
          'name': 'Seafood',
          'headerImage': 'https://example.com/alger_seafood.jpg',
          'restaurantList': [
            {
              'name': 'Alger Seafood Bistro',
              'address': '89 Seaside Road',
              'number': '+213 223344887',
              'rating': 4.8,
              'reviews': 25,
              'image': 'images/alger_seafood.jpg',
              'hours': '10am-11pm',
              'description': 'Seafood restaurant in Alger.',
              'menuImage': 'images/alger_menu.png'
            },
          ],
        },
        {
          'name': 'Cafes',
          'headerImage': 'https://example.com/alger_cafe.jpg',
          'restaurantList': [
            {
              'name': 'Café Alger',
              'address': '99 Café Street',
              'number': '+213 334455667',
              'rating': 4.7,
              'reviews': 50,
              'image': 'images/alger_cafe.jpg',
              'hours': '8am-10pm',
              'description': 'Café offering great coffee and pastries.',
              'menuImage': 'images/alger_menu.png'
            },
          ],
        },
      ],
    },
    {
      'cityName': 'ANNABA',
      'imageUrl': 'images/annaba.jpg',
      'categories': [
        {
          'name': 'Traditional',
          'headerImage': 'https://example.com/annaba_traditional.jpg',
          'restaurantList': [
            {
              'name': 'Annaba Home Dishes',
              'address': '12 Old Town Street',
              'number': '+213 667788990',
              'rating': 4.4,
              'reviews': 15,
              'image': 'images/annaba_traditional.jpg',
              'hours': '10am-11pm',
              'description': 'Traditional meals in Annaba.',
              'menuImage': 'images/annaba_menu.png'
            },
          ],
        },
        {
          'name': 'Fast Food',
          'headerImage': 'https://example.com/annaba_fastfood.jpg',
          'restaurantList': [
            {
              'name': 'Annaba Burger Shack',
              'address': '87 King Street',
              'number': '+213 889900112',
              'rating': 4.1,
              'reviews': 25,
              'image': 'images/annaba_burger.jpg',
              'hours': '10am-11pm',
              'description': 'Delicious fast food in Annaba.',
              'menuImage': 'images/annaba_menu.png'
            },
          ],
        },
        {
          'name': 'Seafood',
          'headerImage': 'https://example.com/annaba_seafood.jpg',
          'restaurantList': [
            {
              'name': 'Annaba Seafood Delights',
              'address': '456 Coastal Street',
              'number': '+213 112233445',
              'rating': 4.6,
              'reviews': 20,
              'image': 'images/annaba_seafood.jpg',
              'hours': '10am-11pm',
              'description': 'Fresh seafood in Annaba.',
              'menuImage': 'images/annaba_menu.png'
            },
          ],
        },
        {
          'name': 'Cafes',
          'headerImage': 'https://example.com/annaba_cafe.jpg',
          'restaurantList': [
            {
              'name': 'Annaba Café',
              'address': '34 Café Street',
              'number': '+213 334455667',
              'rating': 4.7,
              'reviews': 30,
              'image': 'images/annaba_cafe.jpg',
              'hours': '8am-10pm',
              'description': 'Cozy café in Annaba.',
              'menuImage': 'images/annaba_menu.png'
            },
          ],
        },
      ],
    },
    {
      'cityName': 'GUELMA',
      'imageUrl': 'images/guelma.jpg',
      'categories': [
        {
          'name': 'Traditional',
          'headerImage': 'https://example.com/guelma_traditional.jpg',
          'restaurantList': [
            {
              'name': 'Guelma Traditional Dishes',
              'address': '15 Main Street',
              'number': '+213 776655443',
              'rating': 4.7,
              'reviews': 30,
              'image': 'images/guelma_traditional.jpg',
              'hours': '10am-11pm',
              'description': 'Traditional meals in Guelma.',
              'menuImage': 'images/guelma_menu.png'
            },
          ],
        },
        {
          'name': 'Fast Food',
          'headerImage': 'https://example.com/guelma_fastfood.jpg',
          'restaurantList': [
            {
              'name': 'Guelma Burger Spot',
              'address': '21 Burger Lane',
              'number': '+213 556677889',
              'rating': 4.2,
              'reviews': 20,
              'image': 'images/guelma_burger.jpg',
              'hours': '10am-11pm',
              'description': 'Fast food in Guelma.',
              'menuImage': 'images/guelma_menu.png'
            },
          ],
        },
        {
          'name': 'Seafood',
          'headerImage': 'https://example.com/guelma_seafood.jpg',
          'restaurantList': [
            {
              'name': 'Guelma Seafood Grill',
              'address': '54 Seaside Avenue',
              'number': '+213 334455667',
              'rating': 4.3,
              'reviews': 25,
              'image': 'images/guelma_seafood.jpg',
              'hours': '10am-11pm',
              'description': 'Fresh seafood in Guelma.',
              'menuImage': 'images/guelma_menu.png'
            },
          ],
        },
        {
          'name': 'Cafes',
          'headerImage': 'https://example.com/guelma_cafe.jpg',
          'restaurantList': [
            {
              'name': 'Guelma Café Lounge',
              'address': '45 Coffee Plaza',
              'number': '+213 443322110',
              'rating': 4.6,
              'reviews': 30,
              'image': 'images/guelma_cafe.jpg',
              'hours': '8am-10pm',
              'description': 'A relaxing café in Guelma.',
              'menuImage': 'images/guelma_menu.png'
            },
          ],
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.jpg', // Make sure your logo is in the assets folder
          height: 50,
          width: 70, // Set the height of the logo
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 28.0,
              // Adjust the size of the icon if needed
            ),
            color: Colors.black,
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0), // Adjust padding if necessary
            onPressed: () {
              showSearch(
                context: context,
                delegate: RestaurantSearchDelegate(cities: cities),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      categories: city[
                          'categories'], // Pass the selected city's categories
                    ),
                  ),
                );
              },
              child: CityCard(
                cityName: city['cityName']!,
                imageUrl: city['imageUrl']!,
              ),
            );
          },
        ),
      ),
    );
  }
}
