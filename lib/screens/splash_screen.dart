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
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double logoHeight = MediaQuery.of(context).size.height / 4;
    return Scaffold(
      backgroundColor: const Color(0xFF48CAE4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: logoHeight,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
              ),
            ],
          ),
        ),
      ),
    );
  }
}