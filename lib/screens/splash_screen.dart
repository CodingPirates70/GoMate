import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gomate/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 2), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF48CAE4),
      body: Stack(
        children: [
          Positioned(
            top: -width/8,
            right: -width/6,
            child: Image.asset(
              'assets/images/ion_earth_top.png',
              height: height/2, // Adjust the height as needed
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height/4,
                    child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -width/8,
            left: -width*0.04,
            child: Image.asset(
              'assets/images/ion_earth.png',
              height: height/2, // Adjust the height as needed
            ),
          ),
        ],
      ),
    );
  }
}