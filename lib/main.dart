import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/screens/home_screen.dart';
import 'package:incometaxcalculatornepal/utils/config.dart';
//import 'package:incometaxcalculatornepal/screens/test.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color.fromARGB(255, 173, 58, 194)),
    home: const SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppDetails.appIcon,
            scale: 5,
          ),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}
