import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/map.jpg', // Place your image in the assets folder
          fit: BoxFit.cover, // Ensures the image scales to cover the screen
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
