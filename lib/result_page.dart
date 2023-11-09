import 'package:bmi_app/constants.dart';
import 'package:bmi_app/reusable_card.dart';
import 'bottom_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  child: const Text(
            "Your Result",
            textAlign: TextAlign.center,
            style: kTitleTextStyle,
          ))),
          Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      resultText,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyResultTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButton(
            label: "Re-Calculate",
            onPressed: () => {Navigator.pop(context)},
          ),
        ],
      ),
    );
  }
}
