import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Exercise8()));
}

class Exercise8 extends StatefulWidget {
  const Exercise8({super.key});

  @override
  _Exercise8State createState() => _Exercise8State();
}

class _Exercise8State extends State<Exercise8> {
  // Danh sách các câu chuyện với các lựa chọn
  final List<Map<String, Object>> storyData = [
    {
      'story':
          'Bạn bước vào một căn phòng tối và thấy một cái cửa sổ. Bạn sẽ làm gì?',
      'choices': [
        {'text': 'Mở cửa sổ', 'nextStory': 1},
        {'text': 'Đi ra ngoài', 'nextStory': 2},
      ],
    },
    {
      'story':
          'Cửa sổ mở ra và bạn nhìn thấy một con đường mòn dẫn đến một ngôi nhà. Bạn sẽ làm gì?',
      'choices': [
        {'text': 'Đi theo con đường', 'nextStory': 3},
        {'text': 'Quay lại căn phòng', 'nextStory': 4},
      ],
    },
    {
      'story':
          'Bạn đi ra ngoài và bị lạc trong rừng. Cuối cùng bạn bị sói tấn công. Kết thúc!',
      'choices': [],
    },
    {
      'story':
          'Bạn đến ngôi nhà và gặp một người lạ. Người đó mời bạn vào. Bạn sẽ làm gì?',
      'choices': [
        {'text': 'Vào nhà', 'nextStory': 5},
        {'text': 'Từ chối lời mời', 'nextStory': 6},
      ],
    },
    {
      'story':
          'Bạn quay lại căn phòng và bị mắc kẹt trong đó mãi mãi. Kết thúc!',
      'choices': [],
    },
    {
      'story':
          'Người lạ trong ngôi nhà là một pháp sư. Bạn đã có một cuộc trò chuyện tuyệt vời và trở thành bạn bè. Kết thúc!',
      'choices': [],
    },
    {
      'story':
          'Bạn từ chối lời mời và rời đi. Cuối cùng bạn đã tìm được đường về nhà. Kết thúc!',
      'choices': [],
    },
  ];

  int currentStoryIndex = 0;

  // Hàm để thay đổi câu chuyện khi người dùng chọn lựa chọn
  void nextStory(int storyIndex) {
    setState(() {
      currentStoryIndex = storyIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Destini')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              storyData[currentStoryIndex]['story'] as String,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Hiển thị các lựa chọn tiếp theo nếu có
            if (storyData[currentStoryIndex]['choices'] != null)
              ...List.generate(
                (storyData[currentStoryIndex]['choices'] as List).length,
                (index) {
                  final choice =
                      (storyData[currentStoryIndex]['choices'] as List)[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () => nextStory(choice['nextStory'] as int),
                      child: Text(choice['text'] as String),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
