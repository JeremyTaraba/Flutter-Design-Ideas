import 'package:donut_picker/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:donut_picker/screens/products_screen.dart';

void main() {
  runApp(const DonutApp());
}

class DonutApp extends StatelessWidget {
  const DonutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Pacifico',
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
      ),
      home: ProductScreen(),
    );
  }
}
