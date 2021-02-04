import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:xyz/components/roundedbutton.dart';
import 'package:xyz/components/textdetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:xyz/screens/homepage.dart';
import 'package:xyz/screens/loginpage.dart';

class Registeration extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  String name;
  String username;
  String password, confirm_pass, email, otp1, otp2;
  String number;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  //function to validate and save user form
  Future<void> _savingData() async {
    final validation = _form.currentState.validate();
    if (!validation) {
      return;
    }
    _form.currentState.save();
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
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: TextDetails(
                          text: 'Name',
                          onSaved: (String value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Cannot Be Empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'Username',
                        val: false,
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
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'E-mail',
                        val: false,
                        onSaved: (String value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cannot Be Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'Phone number',
                        val: false,
                        onSaved: (value) {
                          number = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cannot Be Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'Password',
                        val: true,
                        controller: _pass,
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
                      SizedBox(
                        height: 10.0,
                      ),
                      TextDetails(
                        text: 'Confirm Password',
                        controller: _confirmPass,
                        val: true,
                        onSaved: (String value) {
                          confirm_pass = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Re-Enter New Password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters long";
                          } else if (value != _pass.text) {
                            return "Password must be same as above";
                          } else {
                            return null;
                          }
                        },
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
                  onPressed: () async {
                    _savingData();
                    final url = 'http://10.0.2.2:5000/verify';
                    final response =
                        await http.post('http://10.0.2.2:5000/verify',
                            body: json.encode({
                              'fullname': name,
                              'username': username,
                              'email': email,
                              'number': number,
                              'password': password,
                            }));
                    //print(response.body);
                    final decoded =
                        json.decode(response.body) as Map<String, dynamic>;
                    //print(decoded);
                    setState(() {
                      if (decoded['status']['type'] == 'success') {
                        Alert(
                            context: context,
                            title: "verify",
                            content: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.send_to_mobile),
                                    labelText: 'OTP for mobile',
                                  ),
                                  onChanged: (value) {
                                    otp1 = value;
                                  },
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.email),
                                    labelText: 'OTP for email',
                                  ),
                                  onChanged: (value) {
                                    otp2 = value;
                                  },
                                ),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                onPressed: () async {
                                  final url = 'http://10.0.2.2:5000/register';
                                  final response = await http.post(
                                      'http://10.0.2.2:5000/register',
                                      body: json.encode({
                                        'otp1': otp1,
                                        'otp2': otp2,
                                      }));
                                  final decoded = json.decode(response.body)
                                      as Map<String, dynamic>;
                                  //print(decoded);
                                  final status = json.decode(decoded['status'])
                                      as Map<String, dynamic>;
                                  setState(() {
                                    if (status['type'] == 'success') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Homepage(),
                                          ));
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: 'Unsucessful Registeration',
                                        desc: decoded['status']['message'],
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "COOL",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  });
                                },
                                child: Text(
                                  "verify",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ]).show();
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: 'Unsucessful Registeration',
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
                  title: "I am already a member",
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
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
