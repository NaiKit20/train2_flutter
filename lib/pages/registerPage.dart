import 'package:flutter/material.dart';
import 'package:train2/pages/loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passCtl = TextEditingController();
  TextEditingController passCfCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("สมัครสมาชิก")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ชื่อ-นามสกุล"),
                  TextField(
                    controller: nameCtl,
                    obscureText: false,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("หมายเลขโทรศัพท์"),
                  TextField(
                    controller: phoneCtl,
                    obscureText: false,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("อีเมล"),
                  TextField(
                    controller: emailCtl,
                    obscureText: false,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("รหัสผ่าน"),
                  TextField(
                    controller: passCtl,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ยืนยันรหัสผ่าน"),
                  TextField(
                    controller: passCfCtl,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      child: const Text("สมัครสมาชิก")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("หากมีบัญชีอยู่แล้ว?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("เข้าสู่ระบบ")),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void register() {
    if (nameCtl.text.isEmpty ||
        phoneCtl.text.isEmpty ||
        emailCtl.text.isEmpty ||
        passCfCtl.text.isEmpty ||
        passCtl.text.isEmpty) {
    } else {
      if (passCfCtl.text == passCtl.text) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    }
  }
}
