import 'package:flutter/material.dart';

class gradient extends StatelessWidget {
  const gradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.brown, Colors.orange],
                  center: Alignment.topRight)),
        ),
      ),
    );
  }
}
