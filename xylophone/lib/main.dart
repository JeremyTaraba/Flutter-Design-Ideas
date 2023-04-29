import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const xylophoneApp());
}

class xylophoneApp extends StatelessWidget {
  const xylophoneApp({Key? key}) : super(key: key);

  void playSound(number) {
    final player = AudioPlayer();
    player.play(AssetSource("note$number.wav"));
  }

  Widget buildKey(soundNumber, keyColor, keyText, keyWidth) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: keyWidth),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => keyColor),
            enableFeedback: false,
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              keyText,
              style: const TextStyle(
                color: Colors.brown,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[400],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.yellow[100], "C", 0.0),
              buildKey(2, Colors.green[300], "D", 10.0),
              buildKey(3, Colors.orange[300], "E", 20.0),
              buildKey(4, Colors.yellow[100], "F", 30.0),
              buildKey(5, Colors.green[300], "G", 40.0),
              buildKey(6, Colors.orange[300], "A", 50.0),
              buildKey(7, Colors.yellow[100], "B", 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
