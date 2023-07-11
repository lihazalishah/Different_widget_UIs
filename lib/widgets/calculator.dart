import 'package:flutter/material.dart';

// ignore: camel_case_types
class calculate extends StatefulWidget {
  @override
  State<calculate> createState() => _calculateState();
}

// ignore: camel_case_types
class _calculateState extends State<calculate> {
  var number1 = TextEditingController();
  var number2 = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Basic Calculator')),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white30,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.15,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller:
                      number1, // num1 is var define above (here controler for catching text)
                  style:
                      const TextStyle(color: Colors.green), // for text colors
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.numbers,
                        color: Colors.green,
                      ),
                      hintText: 'Number1',
                      hintStyle: const TextStyle(color: Colors.green),
                      disabledBorder: OutlineInputBorder(
                          // if texteFiled is disable
                          borderSide: const BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          // if not focus on field
                          borderSide: const BorderSide(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.green),
                          borderRadius: BorderRadius.circular(11)),
                      focusedBorder: OutlineInputBorder(
                          // if focus on texfiled
                          borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.15,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: number2,
                  style: const TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                      hintText: 'Number2',
                      hintStyle: const TextStyle(color: Colors.green),
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      prefixIconColor: Colors.green,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(11)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      onPressed: () {
                        var no1 = int.parse(number1.text.toString());
                        var no2 = int.parse(number2.text.toString());

                        var sum = no1 + no2;

                        result = "Sum of $no1 and $no2 is $sum";
                        setState(() {});
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 8),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      onPressed: () {
                        var no1 = int.parse(number1.text.toString());
                        var no2 = int.parse(number2.text.toString());

                        var sum = no1 - no2;

                        result = "Subtraction of $no1 and $no2 is $sum";
                        setState(() {});
                      },
                      child: const Text(
                        'Sub',
                        style: TextStyle(fontSize: 8),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      onPressed: () {
                        var no1 = int.parse(number1.text.toString());
                        var no2 = int.parse(number2.text.toString());

                        var product = no1 * no2;

                        result =
                            "Multiplication of $no1 and $no2 is ${product.toStringAsFixed(2)}"; // for limiting decimal to 2 digit
                        setState(() {});
                      },
                      child: const Text(
                        'Mul',
                        style: TextStyle(fontSize: 8),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                      onPressed: () {
                        var no1 = int.parse(number1.text.toString());
                        var no2 = int.parse(number2.text.toString());

                        var div = no1 / no2;

                        result =
                            "division of $no1 and $no2 is ${div.toStringAsFixed(2)}";
                        setState(() {});
                      },
                      child: const Text(
                        'Div',
                        style: TextStyle(fontSize: 8),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  result,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
