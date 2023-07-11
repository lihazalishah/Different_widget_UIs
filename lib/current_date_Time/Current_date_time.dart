import 'package:flutter/material.dart';

class date_Time extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => date_TimeState();
}

class date_TimeState extends State<date_Time> {
  @override
  Widget build(BuildContext context) {
    var weekdaylist = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    var monthslist = [
      'Jan',
      'Feb',
      'March',
      'April',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'Oct',
      'Nov',
      'Dec',
    ];
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Current time date')),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Time : ${time.hour}:${time.minute}:${time.second}'),
              Text(
                  'Day : ${weekdaylist[time.weekday - 1]}'), // -1 because array index start with 0 and here list strt with 1
              Text('month : ${monthslist[time.month - 1]}'),
              Text('Year : ${time.year}'),
            ],
          ),
          SizedBox(
            width: 100,
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Date_Time')),
          )
        ],
      )),
    );
  }
}
