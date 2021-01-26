import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xyz/components/roundedbutton.dart';
import 'package:xyz/components/textdetails.dart';
import 'package:xyz/screens/profile.dart';

class editProfile extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  String name;
  String username;
  String password, confirm_pass, email;
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
        appBar: AppBar(
          title: Text(
            "Edit your profile!",
            style: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
          backgroundColor: Color(0xFF121212),
          elevation: 10,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white.withOpacity(0.7),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RoundedButton(
                    colour: Color(0xFFE47070),
                    title: 'Save',
                    onPressed: () => {print("profile details edited.")}),
                //TODO: create a change password screen
                RoundedButton(
                    colour: Color(0xFFE47070),
                    title: 'Change password',
                    onPressed: () => {print("Change password clicked")}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
