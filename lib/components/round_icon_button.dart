import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
      ),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(25.0)),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Colors.white.withOpacity(0.15),
    );
  }
}
