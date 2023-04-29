import 'package:bmeye/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int height;
  final int weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height, 2) * 703;

    return _bmi.toStringAsFixed(1);
  }

  Text getResult() {
    if (_bmi >= 30) {
      return Text(
        "OBESITY",
        style: kWeightStyle(Colors.red),
      );
    } else if (_bmi >= 25) {
      return Text(
        "OVERWEIGHT",
        style: kWeightStyle(Colors.yellow),
      );
    } else if (_bmi >= 18.5) {
      return Text(
        "HEALTHY WEIGHT",
        style: kWeightStyle(Colors.green),
      );
    } else {
      return Text(
        "UNDERWEIGHT",
        style: kWeightStyle(Colors.blue),
      );
    }
  }

  String getInterpretation() {
    if (_bmi >= 30) {
      return "Get help";
    } else if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. Bulk up.";
    }
  }
}
