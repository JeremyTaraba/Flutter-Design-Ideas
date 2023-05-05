import 'package:flutter/material.dart';

class MyTabs extends StatelessWidget {
  const MyTabs({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        child: Image.asset(
          imagePath,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
