import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard(this.genderIcon, this.genderText, this.textColor);

  final IconData genderIcon;
  final String genderText;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kLabelStyle(textColor),
        ),
      ],
    );
  }
}
