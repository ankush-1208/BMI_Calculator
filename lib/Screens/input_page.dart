import 'package:bmi_app/Screens/results_page.dart';
import 'package:bmi_app/result_arguments.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/components/reusable_cardChild.dart';
import 'package:bmi_app/components/reusable_card_widget.dart';
import 'package:bmi_app/constant.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/round_icon_button.dart';
import 'package:bmi_app/BMI_calculation.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum genderType {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  //making variables for the color of male and female buttons and initialising them with kInactiveButtonColor
  //as they will start as inactive buttons.
  Color maleCardColor = kInactiveButtonColor;
  Color femaleCardColor = kInactiveButtonColor;
  genderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.male;
                        });
                      },
                      color: selectedGender == genderType.male
                          ? kActiveButtonColor
                          : kInactiveButtonColor,
                      cardChild: ReusableCardChild(
                        gender: "MALE",
                        genderIcon: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderType.female;
                      });
                    },
                    color: selectedGender == genderType.female
                        ? kActiveButtonColor
                        : kInactiveButtonColor,
                    cardChild: ReusableCardChild(
                      gender: "FEMALE",
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kMeasureNumsStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Color(0xFFc938ad),
                      activeTrackColor: Colors.white.withOpacity(0.9),
                      inactiveTrackColor: Color(0xFF6a6db8),
                      overlayColor: Color(0x29ad3d97),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 240.0,
                      divisions: null,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              color: kActiveButtonColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kMeasureNumsStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  if (weight < 0) weight = 0;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  if (weight > 100) weight = weight + 4;
                                  if (weight > 200) weight = 200;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveButtonColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveButtonColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kMeasureNumsStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                    if (age < 6) age = 6;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                    if (age > 100) age = 100;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(
            onPressed: () {
              BMICalculation calc =
                  BMICalculation(height: height, weight: weight);

              Navigator.pushNamed(context, ResultPage.routeName,
                  arguments: ResultArguments(
                      bmi: calc.bmiCalculation(),
                      getresult: calc.getResult(),
                      interpretation: calc.getInterpretation()));
            },
            text: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
