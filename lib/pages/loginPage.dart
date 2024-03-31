import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:train2/model/GetAllTripRes.dart';
import 'package:train2/pages/registerPage.dart';
import 'package:train2/pages/showTriptsPage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passCtl = TextEditingController();

  String user = " ";
  String password = " ";

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image(
                        image: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/128/201/201623.png")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("อีเมล"),
                        TextField(
                          controller: emailCtl,
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("รหัสผ่าน"),
                        TextField(
                          controller: passCtl,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(child: Text(result)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                            child: const Text("ลงทะเบียนใหม่")),
                        ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            child: const Text("เข้าสู่ระบบ"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> login() async {
    if (emailCtl.text.isNotEmpty &&
        passCtl.text.isNotEmpty &&
        emailCtl.text == user &&
        passCtl.text == password) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ShowTripsPage()));
    } else {
      setState(() {
        emailCtl.text = "";
        passCtl.text = "";
        result = "Invalid User";
      });
    }

    // var res = await http
    //     .get(Uri.parse("https://cslab.it.msu.ac.th/tripbooking/trip"));
    // List<GetAllTripRes> trips = getAllTripResFromJson(res.body);
    // log(trips.length.toString());
  }
}
