import 'package:flutter/material.dart';
import 'package:xyz/components/textdetails.dart';
import 'package:xyz/components/roundedbutton.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xyz/screens/homepage.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'forgot_password';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String password,confirm_pass;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

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
              children: <Widget>[Form(
                key: _form,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextDetails(
                      text: 'Enter new Password',
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
                    RoundedButton(
                      colour: Color(0xFFE47070),
                      title: 'Change Password',
                      onPressed: () async{
                        final url = 'http://10.0.2.2:5000/fp_verify';
                        final response = await http.post(
                            url,
                            body: json.encode({
                              'password': password,

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
                              title: 'Unable to change password',
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
                    )
                  ],
                ),
              )],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _pass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }
}