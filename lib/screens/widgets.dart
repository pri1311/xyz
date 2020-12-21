import 'package:flutter/material.dart';

class Workspacebuttons extends StatelessWidget {
  final String location;
  Workspacebuttons({this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: 0.0,
          top: 20.0,
        ),
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.contain,
                image: new AssetImage(location ?? 'assets/images/ws1.jpg'))));
  }
}
