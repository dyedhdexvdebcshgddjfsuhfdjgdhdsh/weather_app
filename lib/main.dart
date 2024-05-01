import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/models/weather_model.dart';
import 'package:simple_weather_app/provider/weather_provider.dart';
import 'package:simple_weather_app/screens/home_screen.dart';
import 'package:simple_weather_app/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
