import 'package:flutter/material.dart';
import 'package:train2/pages/login2.dart';
import 'package:train2/pages/loginPage.dart';
import 'package:train2/pages/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 101, 245),
      ),
      home: const LoginPage(),
    );
  }
}
