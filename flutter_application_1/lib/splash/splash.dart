import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: const Image(
          image: AssetImage("assests/logo.jpg"),
        ),
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.white);
  }
}
