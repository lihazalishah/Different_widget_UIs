import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:project/bottom_bar/main_page.dart';
import 'package:project/widgets/calculator.dart';
import 'animation/Am_course_1.dart';
import 'animation/Am_course_2.dart';
import 'animation/AnimatedContainer.dart';
import 'animation/hero_anim.dart';
import 'animation/rippleAnim.dart';
import 'animation/tween_Anim.dart';
import 'current_date_Time/Current_date_time.dart';
import 'current_date_Time/datepicker.dart';
import 'current_date_Time/splash_screen.dart';
import 'widgets/clip.dart';
import 'widgets/gradient.dart';
import 'widgets/listwheel.dart';
import 'widgets/richText.dart';
import 'package:project/widgets/textfield.dart';

import 'widgets/card_widgwt.dart';
import 'widgets/gridview.dart';
import 'home.dart';
import 'widgets/inkwell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class NewObj {
  // CLASS FOR ITEMS   for dropdown buton
  final String title;
  final IconData icon;

  NewObj(this.title, this.icon); // comstrutor
}

class _MyAppState extends State<MyApp> {
  static final List<NewObj> items = <NewObj>[
    // obj for dropdown buton
    NewObj('Email', Icons.mail),
    NewObj('Clock', Icons.timer),
    NewObj('Search', Icons.search),
    NewObj('Share', Icons.share)
  ];
  NewObj value = items.first;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      //home: mainPage(),

      // home: c_Animation(),
      // home: AmCourse_2(),
      home: splashScreen(),

      // home: Scaffold(
      //   backgroundColor: Colors.transparent,
      //   appBar: AppBar(),
      //   // body: ListWheel(),
      //   // body: clipwidget(),
      //   body: heroHome(),
      // ),

      // home: Scaffold(
      //   // body: inkWell_Widget(),
      //   // body: Center(child: cardWidget()),
      //   appBar: AppBar(),
      //   body: const richtext(),

      //   // body: gridView(),

      //   // body: Center(  //size box example
      //   //   child: SizedBox.fromSize(
      //   //     child: ElevatedButton(

      //   //       style: ButtonStyle(
      //   //           shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      //   //               borderRadius: BorderRadius.circular(10),
      //   //               side: const BorderSide(width: 1)))),
      //   //       onPressed: () {},
      //   //       child: const Text('click'),
      //   //     ),
      //   //   ),
      //   // ),

      //   // body: Center(child: buildDropdown()), // dropdown button
      // )
    );
  }

  List<Object> newMethod(List<Object> arrColors) => arrColors;

  Widget buildDropdown() => DropdownButtonHideUnderline(
        //for removing underline
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: Colors.black,
                  width: 4)),
          child: DropdownButton<NewObj>(
            // dropdown button

            borderRadius: BorderRadius.circular(
                10), // for rounded border of box after clicking
            value: value, // current select item
            items: items
                .map((item) => DropdownMenuItem<NewObj>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(item.icon),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            item.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ))
                .toList(),
            onChanged: (value) => setState(() {
              this.value = value as NewObj;
            }),
          ),
        ),
      );
}
