import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carame")),
      body: Column(children: [
        FilledButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              image = await picker.pickImage(source: ImageSource.camera);
              setState(() {});
            },
            child: const Text("Camera")),
        // (image != null) ? (kIsWeb) ? Image.network(image!.path) : Image.file(File(image!.path)) : Container()
      ]),
    );
  }
}
