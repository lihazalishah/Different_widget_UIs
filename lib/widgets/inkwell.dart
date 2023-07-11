import 'package:flutter/material.dart';
import 'package:project/widgets/ui_help.dart';

class inkWell_Widget extends StatelessWidget {
  const inkWell_Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          print('tap');
        },
        onDoubleTap: () {
          print('double-tap');
        },
        onLongPress: () {
          print('long-press');
        },
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
          child: Text(
            'hellow',
            style: textstyle11(
                // here we use textstyle function for maintaing theme of app liuke.
                size: 10,
                textcolor: Colors.white,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
