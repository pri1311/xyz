import 'package:flutter/material.dart';
import 'package:xyz/screens/homepage.dart';
import 'package:xyz/screens/loginpage.dart';
import 'package:xyz/screens/registerpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registeration(),
    );
  }
}
