import 'package:flutter/material.dart';

TextStyle kLabelStyle(Color textColor) {
  return TextStyle(
    fontSize: 18.0,
    color: textColor,
  );
}

TextStyle kWeightStyle(Color textColor) {
  return TextStyle(
    fontSize: 35.0,
    color: textColor,
    fontWeight: FontWeight.bold,
  );
}

const kBigStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const kActiveTextColor = Color(0xFFFFFFFF);
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);
const kBarInactiveColor = Color(0xFF8D8E98);
