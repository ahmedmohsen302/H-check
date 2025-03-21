import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginz/login.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Lottie.asset('assets/lottie/GVMRzQ8Gxl.json',
            width: 700, height: 700),
      ),
      nextScreen: LoginPage(),
      backgroundColor: Color.fromARGB(255, 122, 206, 206),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
