import 'package:flutter/material.dart';
import 'dart:math' show pi;

class c_Animation extends StatefulWidget {
  const c_Animation({super.key});

  @override
  State<c_Animation> createState() => _c_AnimationState();
}

class _c_AnimationState extends State<c_Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 2 * pi) //tween is animatin type
        .animate(
            _controller); // start with (0.0)0_Degree end in (2Pi)360_degree
    _controller.repeat(); // for start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller, // controller se value lo or build kro
          builder: (context, child) {
            return Transform(
              alignment: Alignment
                  .center, // mtlb center fix ha (center ko fized rakhty hue transfor kro)
              transform: Matrix4.identity()
                ..rotateY(_animation
                    .value), // here we pass animation value(whose change after every two sec)
              child: Container(
                child: Text('ABC'),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      )
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
