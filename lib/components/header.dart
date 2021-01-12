import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final double size;

  Header({this.title, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFE47070),
              fontSize: size,
            ),
          ),
        ],
      ),
    );
  }
}
