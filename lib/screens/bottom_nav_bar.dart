import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gomate/screens/home_screen.dart';
import 'package:gomate/screens/map_screen.dart';
import 'package:gomate/screens/message_screen.dart';
import 'package:gomate/screens/page_screen.dart';
import 'package:gomate/screens/travel_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    Key? key,
    this.currentIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.09,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        selectedItemColor: Color(0xFF009FE3),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location_solid, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_fill, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_fill, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_solid, size: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MapScreen(),
    MessageScreen(),
    TravelScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}