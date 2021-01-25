import 'package:flutter/material.dart';
import 'package:xyz/screens/welcomepage.dart';
import 'package:xyz/screens/registerpage.dart';
import 'package:xyz/screens/loginpage.dart';
import 'package:xyz/screens/channelPage.dart';
import 'package:xyz/screens/channelList.dart';
import 'package:xyz/screens/profile.dart';
import 'package:xyz/screens/searchPage.dart';
import 'package:xyz/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Registeration.id: (context) => Registeration(),
        LoginPage.id:(context)=>LoginPage(),
        channelList.id:(context)=>channelList(),
      },
    );
  }
}
