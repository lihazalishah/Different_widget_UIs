import 'package:flutter/material.dart';

class ListWheel extends StatelessWidget {
  ListWheel({super.key});

  var arrindex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 50, // height of single child
      children: arrindex
          .map((value) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text('$value'))),
              ))
          .toList(),
    );
  }
}
