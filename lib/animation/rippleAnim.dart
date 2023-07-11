import 'package:flutter/material.dart';

class rippleAnimation extends StatefulWidget {
  const rippleAnimation({super.key});

  @override
  State<rippleAnimation> createState() => _rippleAnimationState();
}

class _rippleAnimationState extends State<rippleAnimation>
    with SingleTickerProviderStateMixin {
  var CircleRadius = [
    100.0,
    150.0,
    200.0,
    50.0,
    40.0,
    30.0,
    20.0,
    10.0,
    5.0,
    4.0,
    3.0,
    2.0,
    1.0,
  ];
  late AnimationController _ripplecontroller;
  late Animation _rippleAnimation;

  @override
  void initState() {
    super.initState();
    _ripplecontroller = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 4,
        ));
    _rippleAnimation = Tween(begin: 0.0, end: 0.9).animate(_ripplecontroller);

    _ripplecontroller.addListener(() {
      print(_rippleAnimation.value);
      setState(() {});
    });
    _ripplecontroller.forward(); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: CircleRadius.map((radius) => Container(
                width: radius * _rippleAnimation.value,
                height: radius * _rippleAnimation.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(1.0 -
                      _rippleAnimation
                          .value), // decresing value of opacity(increasing animation value from 0 to 1 )
                ),
              )).toList(),
        ),
      ),
    );
  }
}
