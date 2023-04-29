import 'package:bmeye/results_page.dart';
import 'package:bmeye/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';
import 'constants.dart';
import 'icon_content.dart';

//enums: used to represent things with words and not numbers
enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType activeGender = GenderType.male;
  Color genderColorMale = kActiveTextColor;
  Color genderColorFemale = kActiveCardColor;
  int height = 60;
  int weight = 100;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI calculator")),
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
                        activeGender = GenderType.male;
                        genderColorMale = kActiveTextColor;
                        genderColorFemale = kActiveCardColor;
                      });
                    },
                    cardColor: activeGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCard(
                        FontAwesomeIcons.mars, "MALE", genderColorMale),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        activeGender = GenderType.female;
                        genderColorFemale = kActiveTextColor;
                        genderColorMale = kActiveCardColor;
                      });
                    },
                    cardColor: activeGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderCard(
                        FontAwesomeIcons.venus, "FEMALE", genderColorFemale),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColor: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "HEIGHT",
                  style: kLabelStyle(kActiveTextColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text((height / 12).floor().toString(), style: kBigStyle),
                    Text(
                      "ft  ",
                      style: kLabelStyle(kActiveTextColor),
                    ),
                    Text((height % 12).round().toString(), style: kBigStyle),
                    Text(
                      "in",
                      style: kLabelStyle(kActiveTextColor),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 13.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 26.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    activeColor: kBottomContainerColor,
                    inactiveColor: kBarInactiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 36,
                    max: 96,
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelStyle(kActiveTextColor),
                      ),
                      Text(
                        weight.toString(),
                        style: kBigStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            pressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            pressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  cardColor: kActiveCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelStyle(kActiveTextColor),
                      ),
                      Text(
                        age.toString(),
                        style: kBigStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            pressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            pressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight: weight, height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(
                child: Text(
                  "Calculate your BMI",
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.pressed});
  final IconData icon;
  final void Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: Icon(icon),
    );
  }
}
