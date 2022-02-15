import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fowl_x/scrreens/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
        splash: Scaffold(
          backgroundColor: Colors.orange,
          body: Center(
            child: Image.asset('assets/logos.jpg', width: 600.0, height: 600.0),
          ),
        ),
        nextScreen: const Login(),
      ),
    );
  }
}
