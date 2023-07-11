import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/current_date_Time/datepicker.dart';

import '../animation/rippleAnim.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => datePicker(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: rippleAnimation());
  }
}
