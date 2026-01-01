import 'package:flutter/material.dart';
import 'list.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoryScreen({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'images/logo.jpg', // Make sure your logo is in the assets folder
            height: 50,
            width: 70, // Set the height of the logo
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Header Image with rounded corners and overlay effect
            Builder(
              builder: (context) {
                final TabController tabController =
                    DefaultTabController.of(context);
                return AnimatedBuilder(
                  animation: tabController,
                  builder: (context, child) {
                    return Container(
                      height: 250, // Set a fixed height for the header image
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              categories[tabController.index]['headerImage']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.3), // Overlay effect
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),

            // TabBar
            Container(
              color: Colors.white, // Background color for the TabBar area
              child: TabBar(
                tabs: categories.map((category) {
                  return Tab(text: category['name']);
                }).toList(),
              ),
            ),

            // Expanded TabBarView for displaying restaurant lists
            Expanded(
              child: TabBarView(
                children: categories.map((category) {
                  return RestaurantListView(
                    restaurants: category['restaurantList'],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
