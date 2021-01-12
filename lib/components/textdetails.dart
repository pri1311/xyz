import 'package:flutter/material.dart';

class TextDetails extends StatelessWidget {
  final String text;
  final bool val;

  TextDetails({this.text, this.val = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: val,
      style: TextStyle(
        color: Colors.white70,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white70,
          ),
        ),
        labelText: text,
        labelStyle: TextStyle(fontSize: 15.0, color: Colors.white70),
      ),
    );
  }
}
