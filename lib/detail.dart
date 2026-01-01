import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  final List<Map<String, dynamic>> _comments = [];
  final List<Map<String, dynamic>> _featuredReviews = [
    {
      'username': 'kamal',
      'rating': 5,
      'text':
          'Amazing experience! The food was excellent, and the service was exceptional.',
    },
    {
      'username': 'manel',
      'rating': 4,
      'text': 'Great ambiance and delicious food. A bit pricey, but worth it.',
    },
  ]; // List of featured reviews
  final TextEditingController _commentController = TextEditingController();
  double _currentRating = 0;

  // Method to handle rating
  void _submitComment() {
    if (_commentController.text.isNotEmpty && _currentRating > 0) {
      setState(() {
        _comments.add({
          'username': 'Sara', // You can replace with actual user name
          'rating': _currentRating,
          'text': _commentController.text,
        });
        _commentController.clear(); // Clear the text field after submission
        _currentRating = 0; // Reset rating
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Restaurant Image with fixed height
                Image.asset(
                  widget.restaurant['image'],
                  height: 220, // Fixed height for image
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),

                // Restaurant Name with fixed size
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.restaurant['name'],
                    style: const TextStyle(
                      fontSize: 24, // Fixed font size
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),

                // Tab Controller for Details and Reviews
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      // Tab Bar with fixed size
                      const TabBar(
                        labelColor: Colors.black,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(text: "Details"),
                          Tab(text: "Reviews"),
                        ],
                      ),

                      // Static Scrolling Content for Tabs
                      SizedBox(
                        height: 500, // Fixed height for TabBarView
                        child: TabBarView(
                          children: [
                            // Details Tab
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Wrap(
                                      spacing: 20,
                                      runSpacing: 10,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.location_on,
                                                size: 18, color: Colors.blue),
                                            SizedBox(width: 5),
                                            Text(
                                              'Restaurant Address',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.phone,
                                                size: 18, color: Colors.green),
                                            SizedBox(width: 5),
                                            Text(
                                              '123-456-7890',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      "Opening Hours: 9:00 AM - 9:00 PM",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Description: A lovely place with great food.",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxWidth: 350,
                                          maxHeight: 250,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset('images/menu.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Reviews Tab
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Reviews",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: _featuredReviews.length,
                                      itemBuilder: (context, index) {
                                        final review = _featuredReviews[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Card(
                                            elevation: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    review['username'],
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: List.generate(
                                                      review['rating'],
                                                      (index) => const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(review['text']),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: _comments.length,
                                      itemBuilder: (context, index) {
                                        final comment = _comments[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Card(
                                            elevation: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    comment['username'],
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: List.generate(
                                                      comment['rating'],
                                                      (index) => const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(comment['text']),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20),

                                    // Write a Comment Section

                                    // Rating Section
                                    const Text(
                                      "Write a Comment",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // TextField with Icon
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: _commentController,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                              hintText: "Enter your comment...",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.send,
                                              color: Colors.blue),
                                          onPressed: _submitComment,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),

                                    // Rating Section
                                    const Text(
                                      "Rate the Restaurant",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(5, (index) {
                                        return IconButton(
                                          icon: Icon(
                                            Icons.star,
                                            color: _currentRating > index
                                                ? Colors.amber
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _currentRating = index + 1.0;
                                            });
                                          },
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black.withOpacity(0.5),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
