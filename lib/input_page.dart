import 'package:bmi_app/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaCardColor = kInactiveCardColor;
  int height = 180;
  int weight = 50;
  int age = 34;

  void updateCardColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == kActiveCardColor) {
        maleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kActiveCardColor;
        femaCardColor = kInactiveCardColor;
      }
    }

    if (gender == Gender.female) {
      if (femaCardColor == kActiveCardColor) {
        femaCardColor = kInactiveCardColor;
      } else {
        femaCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: ReusableCard(
                    color: maleCardColor,
                    childCard: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      texte: "MALE",
                    ),
                  ),
                  onTap: () => {
                    setState(() {
                      updateCardColor(Gender.male);
                    })
                  },
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: ReusableCard(
                    color: femaCardColor,
                    childCard: const IconContent(
                        icon: FontAwesomeIcons.venus, texte: "FEMALE"),
                  ),
                  onTap: () => {
                    setState(() {
                      updateCardColor(Gender.female);
                    })
                  },
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kStyleHeightText,
                      ),
                      const Text("cm"),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) => {
                      setState(() {
                        height = newValue.round();
                      })
                    },
                    activeColor: const Color(0xffeb1555),
                    inactiveColor: const Color(0xff8d8e98),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kStyleHeightText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (() => {
                                  setState(() {
                                    weight++;
                                  })
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kActiveCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kStyleHeightText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
          BottomButton(
            label: "Calculate BMI",
            onPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(bmiResult: calc.getResult(), resultText: calc.calculateBMI(), interpretation: calc.getInterpretation(),);
              }));
            },
          ),
        ],
      ),
    );
  }
}
