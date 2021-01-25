import 'package:flutter/material.dart';

class TextDetails extends StatelessWidget {
  final String text;
  final bool val;
  final Function onSaved;
  final Function validator;
  final TextEditingController controller;

  TextDetails({this.text, this.val = false,this.onSaved,this.validator,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      obscureText: val,
      validator: validator,
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
