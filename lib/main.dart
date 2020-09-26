import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dicee',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  void diceChange() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  Widget diceBuild(String imagePathString) {
    return Expanded(
      child: GestureDetector(
        child: Image.asset(imagePathString),
        onTap: diceChange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          diceBuild(
            'images/dice$leftDiceNumber.png',
          ),
          diceBuild(
            'images/dice$rightDiceNumber.png',
          ),
          // Expanded(
          //   child: FlatButton(
          //     child: Image.asset(
          //       'images/dice$leftDiceNumber.png',
          //     ),
          //     onPressed: diceChange,
          //   ),
          //),
          // Expanded(
          //   child: FlatButton(
          //     child: Image.asset(
          //       'images/dice$rightDiceNumber.png',
          //     ),
          //     onPressed: diceChange,
          //   ),
          // ),
        ],
      ),
    );
  }
}
