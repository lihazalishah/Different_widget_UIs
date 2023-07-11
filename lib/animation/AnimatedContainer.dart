import 'package:flutter/material.dart';

class anim_Container extends StatefulWidget {
  const anim_Container({super.key});

  @override
  State<anim_Container> createState() => anim_ContainerState();
}

class anim_ContainerState extends State<anim_Container> {
  var _width = 100.0; // must be in points otherwise get error below
  var _height = 50.0;

  bool flag = true;

  Color bg_Color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: _width,
              height: _height,
              curve: Curves.elasticInOut,
              decoration: BoxDecoration(color: bg_Color),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (flag) {
                      _width = 50.0;
                      _height = 100.0;
                      flag = false;
                      bg_Color = Colors.amber;
                    } else {
                      _width = 100.0;
                      _height = 50.0;
                      flag = true;
                      bg_Color = Colors.black;
                    }
                  });
                },
                child: Text('Animat')),
          ],
        ),
      ),
    );
  }
}
