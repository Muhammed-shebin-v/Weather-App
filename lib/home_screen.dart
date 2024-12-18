import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_api/model/weather_model.dart';
import 'package:weather_api/service/weather_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //api key
  final _weatherService= WeatherApi(apiKey: 'cb53f935c668877415856395e4cfe27f');
  WeatherModel? _weather;


  //fetch weather
  _fetchWeather() async{
    String cityName = await  _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      log('error occured');
    }
  }
  

  // weather animations
//  String getWeatherAnimation(String? mainCondition){
//   if(mainCondition == null){
//     return 'assets/Animation - 1734518755864.json';
//   }
//   switch (mainCondition.toLowerCase()){
//     case
//   }
//  }


  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
    body: Center(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(30),
            const Icon(Icons.location_pin,color: Colors.grey,size: 45,),
            const Gap(20),            Text(_weather?.cityName ?? 'Loading city',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w900,color: Colors.grey),),
            const Expanded(
            flex: 2,
            child: SizedBox()),
            Lottie.asset('assets/Animation - 1734518659322.json'),
            const Expanded(
            flex: 3,
            child: SizedBox()),
            Text('${_weather?.temperature.round()}° C',style: const TextStyle(fontSize: 50,fontWeight: FontWeight.w900,color: Colors.grey),),
            Text(_weather?.mainCondition ?? "",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.grey),),
            const Expanded(
            flex: 2,
            child: SizedBox()),
          ],
        ),
      ),
    ),
    );
  }
}