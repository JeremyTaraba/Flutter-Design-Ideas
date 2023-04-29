import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.cardColor, this.cardChild, this.onPress});

  final Color cardColor;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
