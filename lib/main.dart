import 'package:flutter/material.dart';
import 'package:weather_api/view/splash_screen.dart';

void main(){
  runApp(const WeatherAPI());
}
class WeatherAPI extends StatelessWidget {
  const WeatherAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weathe API',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}