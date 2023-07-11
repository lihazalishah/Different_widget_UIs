import 'package:flutter/material.dart';
import 'dart:math' show pi;

enum CircleSide {
  // enum for circle sides(not declear in class)
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    // path is a widget
    // here size give width and height of container
    final path = Path();
    late Offset offset; // starting point of drawing
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0); // move 00 to 10 alonge x-asix
        offset = Offset(size.width, size.height); //move 10 to 11 along y-axis
        clockwise = false;
        break;
      case CircleSide.right:
        //path.moveTo(0,0); // no need  to move because by default at 00
        offset = Offset(0, size.height); //move 00 to 01
        clockwise = true;
        break;
    }

    path.arcToPoint(
      // drawing arc from center
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close(); // close path
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  // customclipper put inside clippath widget , in this customclipper we put path created above
  //
  final CircleSide side; // call circleside
  const HalfCircleClipper({
    // contructure
    required this.side,
  }); //

  @override
  Path getClip(Size size) => side.toPath(size); // here we pass path

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      true; // this function redraw path if something cange in the path(redraw everything)
}

class AmCourse_2 extends StatefulWidget {
  @override
  State<AmCourse_2> createState() => AmCourse_2State();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) =>
      Future.delayed(duration, this); // delayed call below
}

class AmCourse_2State extends State<AmCourse_2> with TickerProviderStateMixin {
  late AnimationController
      _counterClockwiseRotationController; // countanimation
  late Animation<double> _counterClockwiseRotationAnimation;

  late AnimationController _flipController;
  late Animation _flipAnimation;

  @override
  void initState() {
    super.initState();
    _counterClockwiseRotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _counterClockwiseRotationAnimation = Tween<double>(
            // tween is animation time
            begin: 0,
            end: -(pi /
                2)) // - pi/2 mean negative 90(because flutter angle are at clock wise and here we are creating animation to anti clockwise)
        .animate(CurvedAnimation(
            // animation with curve(you can out direct parent value here if curve not required)
            parent: _counterClockwiseRotationController,
            curve: Curves.bounceOut));

    // _counterClockwiseRotationController.repeat();

    //flip animation

    _flipController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _flipAnimation = Tween<double>(
            // tween is a animation
            begin: 0,
            end: pi) //  pi mean 180
        .animate(
      CurvedAnimation(
        // animation with curve(you can out direct parent value here if curve not required)
        parent: _flipController,
        curve: Curves.bounceOut,
      ),
    );

    //status listner count animation

    _counterClockwiseRotationController.addStatusListener(
      (status) {
        // status listner allow to run morwe then 1 animaton when one finidhed
        if (status == AnimationStatus.completed) {
          _flipAnimation = Tween<double>(
                  // tween is a animation
                  begin: _flipAnimation.value,
                  end: _flipAnimation.value + pi) //  pi mean 180
              .animate(
            CurvedAnimation(
              // animation with curve(you can out direct parent value here if curve not required)
              parent: _flipController,
              curve: Curves.bounceOut,
            ),
          );

          //reset the flip controller and start animation
          _flipController
            ..reset()
            ..forward();
        }
      },
    );
    //status listner for flip
    _flipController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          //if completed then start next animation
          _counterClockwiseRotationAnimation = Tween<double>(
                  // add current value + initial for continue animation
                  // tween is animation
                  begin: _counterClockwiseRotationAnimation.value,
                  end: _counterClockwiseRotationAnimation.value + -(pi / 2))
              .animate(
            CurvedAnimation(
              // animation with curve(you can out direct parent value here if curve not required)
              parent: _counterClockwiseRotationController,
              curve: Curves.bounceOut,
            ),
          );
          //reset the countwise controller and start animation
          _counterClockwiseRotationController
            ..reset()
            ..forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _counterClockwiseRotationController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockwiseRotationController
      ..reset() // this will reset value of controller every time when we restart ( from 1 to 0) and animation satrt again
      ..forward //delayed call here from above
          .delayed(
              const Duration(seconds: 1)); // start animation after 1 second

    return Scaffold(
      appBar: AppBar(title: Text('Animation')),
      body: SafeArea(
        child: AnimatedBuilder(
          // build animation  a/c to controller
          animation: _counterClockwiseRotationController,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockwiseRotationAnimation
                    .value), // value come from animation not controller
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _flipAnimation,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        child: ClipPath(
                          clipper: const HalfCircleClipper(
                              side: CircleSide
                                  .left), // here we pass halfcircleclipper left side
                          child: Container(
                            width: 50,
                            height: 50,
                            color: const Color(0xff0057b7),
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _flipAnimation,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        child: ClipPath(
                          clipper: const HalfCircleClipper(
                              side: CircleSide
                                  .right), //// here we pass halfcircleclipper right side
                          child: Container(
                            width: 50,
                            height: 50,
                            color: const Color(0xffffd700),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
