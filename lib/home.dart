import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count:$count',
              style: TextStyle(fontSize: 20),
            ),
            FloatingActionButton(
              onPressed: () {
                count++;
                setState(() {});
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
