import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:xyz/components/roundedbutton.dart';
import 'package:xyz/components/textdetails.dart';
import 'package:xyz/components/header.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                SizedBox(
                  height: 100,
                  child: TypewriterAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: Duration(milliseconds: 150),
                    text: ["Hello there.\nWelcome back!"],
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xFFEF7070),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextDetails(
                          text: 'Username',
                        ),
                      ),
                      TextDetails(
                        text: 'Password',
                        val: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                  child: GestureDetector(
                    child: Text(
                      'Forgot your Password',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  colour: Color(0xFFE47070),
                  title: 'Log In',
                ),
                RoundedButton(
                  colour: Color(0xFFE47070),
                  title: "Don't have an account?"
                      " Sign up instead",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
