import 'package:flutter/material.dart';

import 'hero_detail.dart';

class heroHome extends StatelessWidget {
  const heroHome({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => heroAniDetail(),
            ));
      },
      child: Hero(
          tag: 'background',
          child: Center(
            child: Container(
              color: Colors.black,
              width: 50,
              height: 50,
            ),
          )),
    );
  }
}
