import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_api/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/Animation - 1734518659322.json'),
            const Text('Weatheroo!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.grey),)
          ],
        ),
      ),

    );
  }
}