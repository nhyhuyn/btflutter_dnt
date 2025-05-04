import 'dart:math';
import 'package:flutter/material.dart';

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _SingleDicePageState();
}

class _SingleDicePageState extends State<Exercise4> {
  int currentDice = 1;

  void rollDice() {
    setState(() {
      currentDice = Random().nextInt(6) + 1; // từ 1 đến 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(title: const Text('Dice'), backgroundColor: Colors.green),
      body: Center(
        child: GestureDetector(
          onTap: rollDice,
          child: Image.asset('assets/dice$currentDice.png', width: 200),
        ),
      ),
    );
  }
}
