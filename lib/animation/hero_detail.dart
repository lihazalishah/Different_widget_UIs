import 'package:flutter/material.dart';

class heroAniDetail extends StatelessWidget {
  const heroAniDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Hero(
                tag: '',
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.black,
                ))));
  }
}
