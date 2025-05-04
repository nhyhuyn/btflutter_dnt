import 'dart:math';
import 'package:flutter/material.dart';

class Exercise5 extends StatefulWidget {
  const Exercise5({super.key});

  @override
  State<Exercise5> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<Exercise5> {
  final List<String> answers = [
    'Yes',
    'No',
    'Ask again later',
    'Definitely not',
    'Maybe',
    'Absolutely!',
    'I cannot predict now',
    'Most likely',
    'Don’t count on it',
  ];

  String currentAnswer = 'The answer is...';

  void getRandomAnswer() {
    setState(() {
      currentAnswer =
          'The answer is ${answers[Random().nextInt(answers.length)]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magic 8 Ball')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/Magic_eight_ball.png', width: 250),
                Container(
                  width: 140,
                  height: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    currentAnswer,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: getRandomAnswer,
              child: const Text('Hỏi lại!'),
            ),
          ],
        ),
      ),
    );
  }
}
