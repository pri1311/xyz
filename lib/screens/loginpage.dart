import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:xyz/components/roundedbutton.dart';
import 'package:xyz/components/textdetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:xyz/screens/channelList.dart';
import 'package:xyz/screens/channelPage.dart';
import 'package:xyz/screens/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password, username;
  SharedPreferences logindata;
  bool newuser;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  //function to validate and save user form
  Future<void> _savingData() async {
    final validation = _form.currentState.validate();
    if (!validation) {
      return;
    }
    _form.currentState.save();
  }
  @override
  void initState() {

    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushNamed(context, channelList.id);
    }
  }
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
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextDetails(
                          text: 'Username',
                          onSaved: (String value) {
                            username = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Cannot Be Empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      TextDetails(
                        text: 'Password',
                        val: true,
                        onSaved: (String value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter New Password";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters long";
                          }
                          return null;
                        },
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
                  onPressed: () async {
                    _savingData();
                    final url = 'http://10.0.2.2:5000/login';
                    final response = await http.post(
                        'http://10.0.2.2:5000/login',
                        body: json.encode(
                            {'username': username, 'password': password}));
                    final decoded =
                        json.decode(response.body) as Map<String, dynamic>;
                    setState(() {
                      if (decoded['status']['type'] == 'success') {
                        logindata.setBool('login', false);
                        logindata.setString('username', username);
                        Navigator.pushNamed(context, channelList.id);
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: 'Unsucessful login',
                          desc: decoded['status']['message'],
                          buttons: [
                            DialogButton(
                              child: Text(
                                "COOL",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    });
                  },
                ),
                RoundedButton(
                  colour: Color(0xFFE47070),
                  title: "Don't have an account?"
                      " Sign up instead",
                  onPressed: () {
                    Navigator.pushNamed(context, Registeration.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
