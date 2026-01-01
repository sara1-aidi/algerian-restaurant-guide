import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String cityName;
  final String imageUrl;

  const CityCard({
    super.key,
    required this.cityName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 80, // Set a fixed width for the card
      height: 80, // Set a fixed height for the card
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(8.0), // Adjust border radius for smaller size
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0, // Adjust blur radius for smaller size
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(8.0), // Adjust border radius for smaller size
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 4.0, // Adjust position for smaller size
              left: 4.0, // Adjust position for smaller size
              child: Text(
                cityName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12, // Adjust font size for smaller size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
