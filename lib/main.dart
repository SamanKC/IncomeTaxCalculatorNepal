import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incometaxcalculatornepal/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF03DAC6)),
    home: const HomePage(),
  ));
}
