
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mamnon/view/screens/home/home_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/splash Screen 01.png',
      next: (context) => HomeScreen(),
      until: () => Future.delayed(Duration(seconds: 1)),
      startAnimation: 'logoanim',
      backgroundColor: Color(0xff006A56),
    );
  }
}
