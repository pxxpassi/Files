import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    ));
}