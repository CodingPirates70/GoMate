import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StartTripScreen extends StatefulWidget {
  const StartTripScreen({Key? key}) : super(key: key);

  @override
  State<StartTripScreen> createState() => _StartTripScreenState();
}

class _StartTripScreenState extends State<StartTripScreen> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  
  // Focus nodes to track which field is active
  final FocusNode _startFocusNode = FocusNode();
  final FocusNode _endFocusNode = FocusNode();
  
  // Lists to show/hide suggestions
  bool _showStartSuggestions = false;
  bool _showEndSuggestions = false;
  
  // Dummy location data like Google Maps
  final List<Map<String, String>> locationSuggestions = [
    {
      "name": "Kalyani Government Engineering College",
      "address": "Kalyani, Nadia, West Bengal",
      "icon": "🏫"
    },
    {
      "name": "Salt Lake Sector V",
      "address": "Salt Lake City, Kolkata, West Bengal",
      "icon": "🏢"
    },
    {
      "name": "Howrah Railway Station",
      "address": "Howrah, West Bengal",
      "icon": "🚉"
    },
    {
      "name": "Victoria Memorial",
      "address": "Maidan, Kolkata, West Bengal",
      "icon": "🏛️"
    },
    {
      "name": "Park Street",
      "address": "Park Street, Kolkata, West Bengal",
      "icon": "🛣️"
    },
    {
      "name": "Netaji Subhas Chandra Bose Airport",
      "address": "Dumdum, Kolkata, West Bengal",
      "icon": "✈️"
    },
    {
      "name": "New Market",
      "address": "Lindsay Street, Kolkata, West Bengal",
      "icon": "🏪"
    },
    {
      "name": "Digha Sea Beach",
      "address": "Digha, East Midnapore, West Bengal",
      "icon": "🏖️"
    },
    {
      "name": "Darjeeling Mall Road",
      "address": "Darjeeling, West Bengal",
      "icon": "🏔️"
    },
    {
      "name": "Sundarbans National Park",
      "address": "Sundarbans, West Bengal",
      "icon": "🌲"
    }
  ];

  // Sample group trips data
  final List<Map<String, dynamic>> groupTrips = [
    {
      "title": "Mountain Trip",
      "location": "Helgeland",
      "country": "Norway",
      "image": "assets/images/mountain_trip.jpg",
      "completion": "80%",
      "participants": [
        "assets/images/user1.jpg",
        "assets/images/user2.jpg",
        "assets/images/user3.jpg",
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    
    // Listen to focus changes
    _startFocusNode.addListener(() {
      setState(() {
        _showStartSuggestions = _startFocusNode.hasFocus;
        if (_startFocusNode.hasFocus) {
          _showEndSuggestions = false;
        }
      });
    });
    
    _endFocusNode.addListener(() {
      setState(() {
        _showEndSuggestions = _endFocusNode.hasFocus;
        if (_endFocusNode.hasFocus) {
          _showStartSuggestions = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Hide suggestions when tapping outside
            setState(() {
              _showStartSuggestions = false;
              _showEndSuggestions = false;
            });
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  // Top Header with Logo and Notification
                  _buildTopHeader(width, height),
                  SizedBox(height: height * 0.025),
                  // Location Row
                  _buildLocationRow(width),
                  SizedBox(height: height * 0.025),
                  // Search Row
                  _buildSearchRow(width, height),
                  SizedBox(height: height * 0.04),
                  // Trip Planning Card
                  _buildTripPlanningCard(width, height),
                  SizedBox(height: height * 0.04),
                  // Group Trips Section
                  _buildGroupTripsSection(width, height),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: width * 0.07),
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
    );
  }

  Widget _buildLocationRow(double width) {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.black, size: width * 0.05),
        SizedBox(width: 4),
        Text(
          "Kalyani, Nadia",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: width * 0.045,
            color: Colors.black,
          ),
        ),
        Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: width * 0.05),
      ],
    );
  }

  Widget _buildSearchRow(double width, double height) {
    return Row(
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
    );
  }

  Widget _buildTripPlanningCard(double width, double height) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF48CAE4).withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Start Input Field
          _buildTripInputField(
            "Start",
            _startController,
            _startFocusNode,
            width,
            height,
            isStart: true,
          ),
          
          // Start Location Suggestions
          if (_showStartSuggestions)
            _buildLocationSuggestions(true, width, height),
          
          SizedBox(height: height * 0.02),
          
          // Route Visualization
          if (!_showStartSuggestions && !_showEndSuggestions)
            _buildRouteVisualization(width, height),
          
          SizedBox(height: height * 0.02),
          
          // End Input Field
          _buildTripInputField(
            "End",
            _endController,
            _endFocusNode,
            width,
            height,
            isStart: false,
          ),
          
          // End Location Suggestions
          if (_showEndSuggestions)
            _buildLocationSuggestions(false, width, height),
          
          SizedBox(height: height * 0.035),
          
          // Let's Go Button
          if (!_showStartSuggestions && !_showEndSuggestions)
            _buildLetsGoButton(width, height),
        ],
      ),
    );
  }

  Widget _buildTripInputField(
    String label,
    TextEditingController controller,
    FocusNode focusNode,
    double width,
    double height, {
    required bool isStart,
  }) {
    return Row(
      children: [
        Container(
          width: width * 0.04,
          height: width * 0.04,
          decoration: BoxDecoration(
            color: Color(0xFF48CAE4),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: width * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.008),
              TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: label == "Start" ? "Choose starting point" : "Choose destination",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.045,
                  ),
                ),
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {
                  setState(() {
                    if (isStart) {
                      _showStartSuggestions = true;
                      _showEndSuggestions = false;
                    } else {
                      _showEndSuggestions = true;
                      _showStartSuggestions = false;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSuggestions(bool isStart, double width, double height) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.01, left: width * 0.08),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Current Location Option
          _buildSuggestionTile(
            icon: "📍",
            title: "Current Location",
            subtitle: "Kalyani, Nadia, West Bengal",
            width: width,
            height: height,
            isCurrentLocation: true,
            onTap: () {
              if (isStart) {
                _startController.text = "Current Location";
              } else {
                _endController.text = "Current Location";
              }
              setState(() {
                _showStartSuggestions = false;
                _showEndSuggestions = false;
              });
              FocusScope.of(context).unfocus();
            },
          ),
          
          // Divider
          Divider(height: 1, color: Colors.grey),
          
          // Recent/Popular locations
          ...locationSuggestions.take(5).map((location) => 
            _buildSuggestionTile(
              icon: location['icon']!,
              title: location['name']!,
              subtitle: location['address']!,
              width: width,
              height: height,
              onTap: () {
                if (isStart) {
                  _startController.text = location['name']!;
                } else {
                  _endController.text = location['name']!;
                }
                setState(() {
                  _showStartSuggestions = false;
                  _showEndSuggestions = false;
                });
                FocusScope.of(context).unfocus();
              },
            )
          ).toList(),
        ],
      ),
    );
  }

  Widget _buildSuggestionTile({
    required String icon,
    required String title,
    required String subtitle,
    required double width,
    required double height,
    required VoidCallback onTap,
    bool isCurrentLocation = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.015,
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: width * 0.1,
              height: width * 0.1,
              decoration: BoxDecoration(
                color: isCurrentLocation 
                    ? Color(0xFF48CAE4).withOpacity(0.1) 
                    : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  icon,
                  style: TextStyle(fontSize: width * 0.05),
                ),
              ),
            ),
            SizedBox(width: width * 0.03),
            
            // Location Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.04,
                      color: isCurrentLocation ? Color(0xFF48CAE4) : Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.002),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * 0.035,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
            // Distance/Time info (optional)
            if (!isCurrentLocation)
              Text(
                "${(5 + locationSuggestions.indexOf({'icon': icon, 'name': title, 'address': subtitle}) * 2)} km",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: width * 0.032,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteVisualization(double width, double height) {
    return Container(
      height: height * 0.06,
      child: CustomPaint(
        size: Size(width * 0.8, height * 0.06),
        painter: RoutePainter(),
      ),
    );
  }

  Widget _buildLetsGoButton(double width, double height) {
    return GestureDetector(
      onTap: () {
        // Handle Let's Go button tap
        print("Let's Go button tapped!");
        print("Start: ${_startController.text}");
        print("End: ${_endController.text}");
        // Add navigation or trip start logic here
      },
      child: Container(
        width: double.infinity,
        height: height * 0.065,
        decoration: BoxDecoration(
          color: Color(0xFF48CAE4),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF48CAE4).withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Let's Go",
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGroupTripsSection(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Group Trips",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
                color: Colors.black,
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
        SizedBox(height: height * 0.02),
        // Group Trips Cards
        ...groupTrips.map((trip) => _buildGroupTripCard(trip, width, height)),
      ],
    );
  }

  Widget _buildGroupTripCard(Map<String, dynamic> trip, double width, double height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.015),
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Trip Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: width * 0.2,
              height: width * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF4CAF50),
                    Color(0xFF2196F3),
                  ],
                ),
              ),
              child: Image.asset('assets/images/mountains.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: width * 0.04),
          // Trip Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.045,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: width * 0.04,
                      color: Colors.grey,
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      "${trip['location']}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: width * 0.038,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.005),
                Text(
                  trip['country'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
          ),
          // Progress and Flag
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: width * 0.08,
                height: width * 0.05,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    "🇳🇴",
                    style: TextStyle(fontSize: width * 0.03),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                trip['completion'],
                style: TextStyle(
                  color: Color(0xFF48CAE4),
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    _startFocusNode.dispose();
    _endFocusNode.dispose();
    super.dispose();
  }
}

// Custom Painter for Route Visualization
class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF48CAE4)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    
    // Start from left
    path.moveTo(0, size.height * 0.5);
    
    // Create curved dashed line
    final double controlX1 = size.width * 0.3;
    final double controlY1 = size.height * 0.8;
    final double controlX2 = size.width * 0.7;
    final double controlY2 = size.height * 0.2;
    final double endX = size.width;
    final double endY = size.height * 0.5;
    
    path.cubicTo(controlX1, controlY1, controlX2, controlY2, endX, endY);
    
    // Create dashed effect
    final dashPaint = Paint()
      ..color = Color(0xFF48CAE4)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    _drawDashedPath(canvas, path, dashPaint, 8.0, 4.0);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint, double dashLength, double gapLength) {
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      bool draw = true;
      while (distance < pathMetric.length) {
        final double length = draw ? dashLength : gapLength;
        final Path segment = pathMetric.extractPath(distance, distance + length);
        if (draw) {
          canvas.drawPath(segment, paint);
        }
        distance += length;
        draw = !draw;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
