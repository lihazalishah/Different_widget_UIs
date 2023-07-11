import 'package:flutter/material.dart';

class tweenAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => tweenAnimationState();
}

// ignore: camel_case_types
class tweenAnimationState extends State<tweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _tweencontroller;
  late Animation _colorsAnimation;
  late Animation<double> _tweenanimation;

  @override
  void initState() {
    super.initState();
    _tweencontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _tweenanimation =
        Tween<double>(begin: 0.0, end: 100).animate(_tweencontroller);
    _colorsAnimation = ColorTween(
            begin: Colors.black, end: Colors.green) // colorTween use for colors
        .animate(_tweencontroller);

    _tweencontroller.addListener(() {
      // for changing state in animation
      setState(() {});
    });

    _tweencontroller.repeat(); //for start animation
  }

  @override
  void dispose() {
    _tweencontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: _tweenanimation.value,
          height: _tweenanimation.value,
          color: _colorsAnimation.value,
        ),
      ),
    );
  }
}
