import 'package:flutter/material.dart';
import 'package:bmi_app/constant.dart';

class ReusableCardChild extends StatelessWidget {
  ReusableCardChild({@required this.genderIcon, @required this.gender});
  final IconData genderIcon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.genderIcon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          this.gender,
          textAlign: TextAlign.center,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
