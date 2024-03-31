import 'package:flutter/material.dart';

class Login2Page extends StatefulWidget {
  const Login2Page({super.key});

  @override
  State<Login2Page> createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {
  // State
  String text = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(text),
              ElevatedButton(
                  onPressed: () => changeText(), child: const Text("OK"))
            ],
          ),
        ));
  }

  void changeText() {
    setState(() {
      text = "OK";
    });
  }
}
