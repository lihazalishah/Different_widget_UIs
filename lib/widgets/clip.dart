import 'package:flutter/material.dart';

class clipwidget extends StatelessWidget {
  const clipwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.amberAccent,
          width: 200,
          height: 100,
        ),
      ),
    );
  }
}
