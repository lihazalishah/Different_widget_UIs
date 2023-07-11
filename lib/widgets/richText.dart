import 'package:flutter/material.dart';

class richtext extends StatelessWidget {
  const richtext({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            children: [
          TextSpan(text: 'Hellow '),
          TextSpan(
              text: 'World! ',
              style: TextStyle(fontSize: 25, color: Colors.blue)),
          TextSpan(text: 'Welcome to '),
          TextSpan(
              text: 'Flutter! ',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.redAccent,
                  fontStyle: FontStyle.italic)),
          TextSpan(text: 'We are using '),
          TextSpan(
              text: 'RichText Widget',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontStyle: FontStyle.italic)),
        ]));
  }
}
