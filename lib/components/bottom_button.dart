import 'package:flutter/material.dart';
import 'package:bmi_app/constant.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({@required this.onPressed, @required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: Color(0xFFc938ad),
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: kLargeButtonStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
