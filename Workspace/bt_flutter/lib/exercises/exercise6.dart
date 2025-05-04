import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Exercise6 extends StatelessWidget {
  const Exercise6({super.key});

  void playSound(int note) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$note.wav'));
  }

  Expanded buildKey({required Color color, required int note}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () => playSound(note),
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(color: Colors.red, note: 1),
            buildKey(color: Colors.orange, note: 2),
            buildKey(color: Colors.yellow, note: 3),
            buildKey(color: Colors.green, note: 4),
            buildKey(color: Colors.teal, note: 5),
            buildKey(color: Colors.blue, note: 6),
            buildKey(color: Colors.purple, note: 7),
          ],
        ),
      ),
    );
  }
}
