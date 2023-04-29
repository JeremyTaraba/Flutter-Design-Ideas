import 'package:bmeye/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText});

  final String bmiResult;
  final Text resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Your Results",
                style: kBigStyle,
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                decoration: BoxDecoration(
                    color: kActiveCardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: resultText),
                    Center(
                        child: Text(
                      bmiResult,
                      style: const TextStyle(
                        color: kActiveTextColor,
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kActiveTextColor,
                          fontSize: 24,
                        ),
                      ),
                    )),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              color: kBottomContainerColor,
              child: const Center(
                child: Text(
                  "Recalculate",
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
