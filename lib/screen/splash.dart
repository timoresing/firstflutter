import 'dart:async';

import 'package:firstflutter/screen/auth/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/screen/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNextScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthWrapper()
        )
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 2500),
        _navigateToNextScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              'assets/images/top-linear.png'
          ),
          Image.asset(
              'assets/images/logo.png',
              width: 174
          ),
          Image.asset(
              'assets/images/bottom.png'
          )
        ],
      ),
    );
  }
}
