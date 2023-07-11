import 'package:flutter/material.dart';
import 'package:project/widgets/ui_help.dart';

class gridView extends StatefulWidget {
  const gridView({super.key});

  @override
  State<gridView> createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  @override
  Widget build(BuildContext context) {
    var arrColors = [
      Colors.amber,
      Colors.blue,
      Colors.red,
      Colors.black,
      Colors.pink
    ];

    return Scaffold(
        body: GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100), // for size
      // const SliverGridDelegateWithFixedCrossAxisCount( // count
      //     crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          color: arrColors[index],
        );
      },
      itemCount: arrColors.length,
    )
        // GridView.extent(
        //   maxCrossAxisExtent: 100,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   padding: EdgeInsets.all(2),
        //   children: [
        //     Container(color: arrColors[0]),
        //     Container(
        //       color: arrColors[1],
        //     ),
        //     Container(
        //       color: arrColors[2],
        //     ),
        //     Container(
        //       color: arrColors[3],
        //     ),
        //     Container(
        //       color: arrColors[4],
        //     ),
        //     Container(
        //       color: arrColors[1],
        //     ),
        //     Container(
        //       color: arrColors[2],
        //     ),
        //     Container(
        //       color: arrColors[3],
        //     ),
        //     Container(
        //       color: arrColors[4],
        //     ),
        //   ],
        // ),

        );
  }
}
