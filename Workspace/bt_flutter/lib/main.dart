import 'package:flutter/material.dart';
import 'exercises/exercise1.dart';
import 'exercises/exercise2.dart';
import 'exercises/exercise3.dart';
import 'exercises/exercise4.dart';
import 'exercises/exercise5.dart';
import 'exercises/exercise6.dart';
import 'exercises/exercise7.dart';
import 'exercises/exercise8.dart';
import 'exercises/exercise9.dart';
import 'exercises/exercise10.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> exercises = const [
    {'title': 'Bài tập 1 - I am rich', 'widget': Exercise1()},
    {'title': 'Bài tập 2 - I am poor', 'widget': Exercise2()},
    {'title': 'Bài tập 3 - MiCard', 'widget': Exercise3()},
    {'title': 'Bài tập 4 - Dice', 'widget': Exercise4()},
    {'title': 'Bài tập 5 - Magic 8 Ball', 'widget': Exercise5()},
    {'title': 'Bài tập 6 - Xylophone', 'widget': Exercise6()},
    {'title': 'Bài tập 7 - Quiz', 'widget': Exercise7()},
    {'title': 'Bài tập 8 - Destini', 'widget': Exercise8()},
    {'title': 'Bài tập 9 - BMI Calculator', 'widget': Exercise9()},
    {'title': 'Bài tập 10 - Clima-weather app', 'widget': Exercise10()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách Bài tập')),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]['title']),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => exercises[index]['widget']),
              );
            },
          );
        },
      ),
    );
  }
}
