import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomate/screens/page_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double slideValue = 0.0;
  bool isSlid = false;
  int selectedCategoryIndex = 0; // Track selected category

  final List<Map<String, String>> categories = [
    {"label": "Lakes", "icon": "assets/images/lake_icon.png"},
    {"label": "Sea", "icon": "assets/images/lake_icon.png"},
    {"label": "Mountain", "icon": "assets/images/lake_icon.png"},
    {"label": "Forest", "icon": "assets/images/lake_icon.png"},
  ];

  final List<Map<String, dynamic>> trips = [
    {
      "title": "Lake Park",
      "location": "Kalyani",
      "image": "assets/images/lake.png",
      "price": "\$40 /Visit",
      "rating": 4.5,
      "isFav": true,
    },
    {
      "title": "College OPP",
      "location": "IIT Kalyani",
      "image": "assets/images/college_opp.png",
      "price": "\$40 /Visit",
      "rating": 4.5,
      "isFav": false,
    },
    {
      "title": "Sea Beach",
      "location": "Digha",
      "image": "assets/images/lake.png",
      "price": "\$60 /Visit",
      "rating": 4.7,
      "isFav": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                // Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo_blue.png',
                      height: height * 0.045,
                    ),
                    Icon(
                      CupertinoIcons.bell_fill,
                      color: Color(0xFF48CAE4),
                      size: width * 0.07,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.025),
                // Location Row
                Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF48CAE4), size: width * 0.05),
                    SizedBox(width: 4),
                    Text(
                      "Kalyani, Nadia",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.045,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: width * 0.05),
                  ],
                ),
                SizedBox(height: height * 0.025),
                // Search Row
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: height * 0.055,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F6FA),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12),
                            Icon(Icons.search, color: Colors.grey, size: width * 0.06),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: width * 0.04),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: height * 0.055,
                      width: height * 0.055,
                      decoration: BoxDecoration(
                        color: Color(0xFF48CAE4),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(Icons.tune, color: Colors.white, size: width * 0.06),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                // Categories Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF48CAE4),
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.015),
                // Categories Chips
                SizedBox(
                  height: height * 0.055,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final bool selected = index == selectedCategoryIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: _categoryChip(category['label']!, category['icon']!, width, selected: selected),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.03),
                // Top Trips Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Trips",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF48CAE4),
                        fontWeight: FontWeight.w500,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.015),
                // Top Trips Cards
                SizedBox(
                  height: height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LakeParkCard()), // Navigate to LakeParkCard
                          );
                        },
                        child: _tripCard(
                          width,
                          height,
                          image: trip['image'],
                          title: trip['title'],
                          location: trip['location'],
                          price: trip['price'],
                          rating: trip['rating'],
                          isFav: trip['isFav'],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.025),
                // Start Travelling Card with Slidable Button
                _startTravellingCard(width, height),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryChip(String label, String iconPath, double width, {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? Color(0xFF48CAE4).withOpacity(0.1) : Color(0xFFF4F6FA),
          borderRadius: BorderRadius.circular(20),
          border: selected ? Border.all(color: Color(0xFF48CAE4), width: 1.5) : null,
        ),
        child: Row(
          children: [
            Image.asset(iconPath, height: width * 0.1),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: selected ? Color(0xFF48CAE4) : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tripCard(
    double width,
    double height, {
    required String image,
    required String title,
    required String location,
    required String price,
    required double rating,
    required bool isFav,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: width * 0.45,
          decoration: BoxDecoration(
            color: Color(0xFFF4F6FA),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: width * 0.45,
                height: height * 0.11,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.045,
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Color(0xFF48CAE4), size: width * 0.04),
                        SizedBox(width: 2),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: width * 0.035,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            color: Color(0xFF48CAE4),
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.04,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Color(0xFF48CAE4) : Colors.grey,
                          size: width * 0.05,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: width * 0.04),
                        SizedBox(width: 2),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: width * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _startTravellingCard(double width, double height) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.045),
      decoration: BoxDecoration(
        color: Color(0xFFF4F6FA),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Start Travelling",
            style: TextStyle(
              color: Color(0xFF009FE3),
              fontWeight: FontWeight.bold,
              fontSize: width * 0.06,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "Start the travel to get your travel going",
            style: TextStyle(
              color: Colors.black54,
              fontSize: width * 0.04,
            ),
          ),
          SizedBox(height: height * 0.025),
          LayoutBuilder(
            builder: (context, constraints) {
              final double sliderWidth = constraints.maxWidth;
              final double buttonSize = height * 0.06;
              return GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    slideValue += details.delta.dx;
                    slideValue = slideValue.clamp(0.0, sliderWidth - buttonSize);
                  });
                },
                onHorizontalDragEnd: (details) {
                  if (slideValue > sliderWidth - buttonSize * 1.5) {
                    setState(() {
                      slideValue = sliderWidth - buttonSize;
                      isSlid = true;
                    });
                  } else {
                    setState(() {
                      slideValue = 0.0;
                      isSlid = false;
                    });
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      width: sliderWidth,
                      height: buttonSize,
                      decoration: BoxDecoration(
                        color: Color(0xFF48CAE4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 120),
                      left: slideValue,
                      top: 0,
                      child: Container(
                        width: buttonSize,
                        height: buttonSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_forward, color: Color(0xFF48CAE4), size: width * 0.07),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}