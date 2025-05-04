import 'package:flutter/material.dart';

class Exercise7 extends StatefulWidget {
  const Exercise7({super.key});

  @override
  State<Exercise7> createState() => _Exercise7State();
}

class _Exercise7State extends State<Exercise7> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'Thủ đô của Việt Nam là?',
      'answers': ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng'],
      'correct': 'Hà Nội',
    },
    {
      'question': '2 + 2 = ?',
      'answers': ['3', '4', '5'],
      'correct': '4',
    },
    {
      'question': 'Màu của bầu trời là gì?',
      'answers': ['Xanh', 'Đỏ', 'Vàng'],
      'correct': 'Xanh',
    },
    {
      'question': 'Động vật nào được gọi là "chúa sơn lâm"?',
      'answers': ['Sư tử', 'Hổ', 'Báo'],
      'correct': 'Hổ',
    },
    {
      'question': 'Ai là người sáng lập Microsoft?',
      'answers': ['Steve Jobs', 'Elon Musk', 'Bill Gates'],
      'correct': 'Bill Gates',
    },
    {
      'question': 'Sông nào dài nhất thế giới?',
      'answers': ['Amazon', 'Nile', 'Mississippi'],
      'correct': 'Nile',
    },
    {
      'question': 'Quốc gia nào có diện tích lớn nhất thế giới?',
      'answers': ['Nga', 'Mỹ', 'Canada'],
      'correct': 'Nga',
    },
    {
      'question': 'Môn thể thao vua là?',
      'answers': ['Bóng đá', 'Bóng rổ', 'Quần vợt'],
      'correct': 'Bóng đá',
    },
    {
      'question': 'Trong bảng tuần hoàn hóa học, ký hiệu của nước là gì?',
      'answers': ['O2', 'H2O', 'CO2'],
      'correct': 'H2O',
    },
    {
      'question': 'Loài chim nào có thể bay lùi?',
      'answers': ['Chim bồ câu', 'Chim sẻ', 'Chim ruồi'],
      'correct': 'Chim ruồi',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  // Hàm kiểm tra câu trả lời
  void checkAnswer(String answer) {
    final correctAnswer = questions[currentQuestionIndex]['correct'] as String;
    if (answer == correctAnswer) {
      setState(() {
        score++;
      });
    }
    // Chuyển sang câu hỏi tiếp theo
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Hiển thị kết quả cuối cùng khi hết câu hỏi
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Kết quả'),
                content: Text('Điểm của bạn là: $score/${questions.length}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex = 0;
                        score = 0;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Bắt đầu lại'),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Hiển thị câu hỏi
            Text(
              question['question'] as String,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Hiển thị các đáp án
            ...(question['answers'] as List<String>).map((answer) {
              return ElevatedButton(
                onPressed: () => checkAnswer(answer),
                child: Text(answer),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
