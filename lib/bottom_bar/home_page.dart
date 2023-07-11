import 'package:flutter/material.dart';

class homeBarpage extends StatefulWidget {
  const homeBarpage({super.key});

  @override
  State<homeBarpage> createState() => _homeBarpageState();
}

class _homeBarpageState extends State<homeBarpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'home bar page',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
