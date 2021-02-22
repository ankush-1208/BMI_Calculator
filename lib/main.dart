import 'package:flutter/material.dart';
import 'package:bmi_app/Screens/input_page.dart';
import 'package:bmi_app/Screens/results_page.dart';

void main() => runApp(BMICalculator());

//COLORS #274A61, #8184D6, #E086CE

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1d1b30),
        scaffoldBackgroundColor: Color(0xFF1d1b30),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}
