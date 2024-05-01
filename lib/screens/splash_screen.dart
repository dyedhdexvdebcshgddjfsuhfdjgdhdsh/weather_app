import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_weather_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }), (route) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/loading_splash.gif',
              width: 400,
              height: 400,
              scale: 1,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Loading....',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
