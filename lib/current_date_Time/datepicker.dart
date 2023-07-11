import 'package:flutter/material.dart';

class datePicker extends StatefulWidget {
  const datePicker({super.key});

  @override
  State<datePicker> createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {
  bool flagDate = true;
  bool flagTime = true;
  DateTime? datepicked;
  TimeOfDay? TimePicker;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('date picker'))),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(flagDate
                ? ''
                : 'select Date ${datepicked?.day}-${datepicked?.month}-${datepicked?.year}'),
            ElevatedButton(
                onPressed: () async {
                  datepicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019), // start from
                      lastDate: DateTime(2024)); // end

                  if (datepicked != null) {}
                  flagDate = false;
                  print(
                      'selected Date ${datepicked?.day}-${datepicked?.month}-${datepicked?.year}');
                  setState(() {});
                },
                child: Text('Show date')),
            const SizedBox(
              height: 10,
            ),
            Text(flagTime
                ? ''
                : 'selected Time ${TimePicker?.hour}:${TimePicker?.minute}'),
            ElevatedButton(
                onPressed: () async {
                  TimePicker = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.dial); // end

                  if (TimePicker != null) {
                    flagTime = false;
                    print(
                        'select time ${TimePicker?.hour}:${TimePicker?.minute}');
                    setState(() {});
                  }
                },
                child: Text('Show time'))
          ],
        ),
      ),
    );
  }
}
