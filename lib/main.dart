import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xyz/screens/welcomepage.dart';
import 'package:xyz/screens/registerpage.dart';
import 'package:xyz/screens/loginpage.dart';
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/register':
            return PageTransition(
              child: Registeration(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
            );
            break;
          case '/login':
            return PageTransition(
              child: LoginPage(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
              duration: Duration(milliseconds: 500),
              reverseDuration: Duration(milliseconds: 500),
            );
            break;
          default:
            return null;
        }
      },
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Registeration.id: (context) => Registeration(),
        LoginPage.id: (context) => LoginPage(),
        Homepage.id: (context) => Homepage(),
      },
    );
  }
}
