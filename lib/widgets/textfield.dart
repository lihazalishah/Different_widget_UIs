import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController(); // for catching text of filed
  var pasward = TextEditingController(); //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Login'))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: TextField(
              controller:
                  email, // email is var define above (here controler for catching text)
              style: const TextStyle(color: Colors.green), // for text colors
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.green,
                  ),
                  hintText: 'Email',
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
            width: 200,
            child: TextField(
              controller:
                  pasward, // passward is var define above (here controler for catching text)
              obscureText: true,
              obscuringCharacter: '*',
              style: const TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  hintText: 'Passward',
                  hintStyle: const TextStyle(color: Colors.green),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.green,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.green),
                      borderRadius: BorderRadius.circular(11)),
                  focusedBorder: OutlineInputBorder(
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
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                var userMail = email.text;
                var userPassward = pasward.text;
                print('Email:$userMail\n passward :$userPassward');
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 15),
              )),
        ],
      )),
    );
  }
}
