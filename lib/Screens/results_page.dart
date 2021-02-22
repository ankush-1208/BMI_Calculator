import 'package:flutter/material.dart';
import 'package:bmi_app/constant.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/reusable_card_widget.dart';
import 'package:bmi_app/result_arguments.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/second';

  @override
  Widget build(BuildContext context) {
    final ResultArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              "Your Result",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveButtonColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    args.getresult,
                    style: kBMIresultTypeStyle,
                  ),
                  Text(
                    args.bmi,
                    style: kBMIresultStyle,
                  ),
                  Text(
                    args.interpretation,
                    style: kBMIstatementStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Bottombutton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "RE-CALCULATE",
          )
        ],
      ),
    );
  }
}
