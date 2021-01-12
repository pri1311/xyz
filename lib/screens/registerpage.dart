import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:xyz/components/roundedbutton.dart';
import 'package:xyz/components/textdetails.dart';
import 'package:xyz/components/header.dart';

class Registeration extends StatelessWidget {
  static const String id = 'register_screen';
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
                  child: TypewriterAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: Duration(milliseconds: 150),
                    text: ["Get on board!"],
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
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: TextDetails(
                          text: 'Name',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'E-mail',
                        val: false,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'Password',
                        val: true,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'Confirm Password',
                        val: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                  colour: Color(0xFFE47070),
                  title: 'Sign Up',
                ),
                RoundedButton(
                    colour: Color(0xFFE47070), title: "I am already a member"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
