import 'package:flutter/material.dart';
import 'package:project/bottom_bar/bar_items.dart';
import 'package:project/bottom_bar/home_page.dart';
import 'package:project/bottom_bar/my_page.dart';
import 'package:project/bottom_bar/search_page.dart';

class mainPage extends StatefulWidget {
  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  List pages = [
    homeBarpage(),
    bar_items(),
    searchPage(),
    MyPage(),
  ];
  var pageIndex = 0;
  void ontap(int index) {
    // set index on tap
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex], //passing pageindex to list
      bottomNavigationBar: BottomNavigationBar(
        // its take index of page as currenr index
        onTap: ontap, // ontap functin catch index for changing page
        currentIndex: pageIndex, // passing index on tap
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed, // for bg fix
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.4),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        landscapeLayout:
            BottomNavigationBarLandscapeLayout.centered, //icpns kha ho??

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_rounded,
              ),
              label: 'Bar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: 'My'),
        ],
      ),
    );
  }
}
