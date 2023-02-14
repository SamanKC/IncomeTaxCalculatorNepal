import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/utils/config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppDetails.appName,
      home: Scaffold(),
    );
  }
}
