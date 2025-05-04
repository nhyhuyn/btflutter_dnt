import 'package:flutter/material.dart';

class Exercise9 extends StatefulWidget {
  const Exercise9({super.key});

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<Exercise9> {
  final _formKey = GlobalKey<FormState>();

  // Các biến lưu trữ thông tin của người dùng
  double height = 0.0;
  double weight = 0.0;
  String result = '';
  String category = '';

  // Hàm tính BMI
  void calculateBMI() {
    if (_formKey.currentState?.validate() ?? false) {
      double bmi = weight / (height * height);
      setState(() {
        result = bmi.toStringAsFixed(2);

        // Phân loại BMI
        if (bmi < 18.5) {
          category = 'Thiếu cân';
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          category = 'Bình thường';
        } else if (bmi >= 25 && bmi <= 29.9) {
          category = 'Thừa cân';
        } else {
          category = 'Béo phì';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 30),
              // Trường nhập liệu cho chiều cao
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Chiều cao (m)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    height = double.tryParse(value) ?? 0.0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập chiều cao';
                  } else if (double.tryParse(value) == null ||
                      double.tryParse(value)! <= 0) {
                    return 'Chiều cao phải lớn hơn 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Trường nhập liệu cho cân nặng
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cân nặng (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    weight = double.tryParse(value) ?? 0.0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập cân nặng';
                  } else if (double.tryParse(value) == null ||
                      double.tryParse(value)! <= 0) {
                    return 'Cân nặng phải lớn hơn 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              // Nút tính toán BMI
              ElevatedButton(
                onPressed: calculateBMI,
                child: const Text('Tính BMI'),
              ),
              const SizedBox(height: 30),
              // Hiển thị kết quả BMI
              if (result.isNotEmpty)
                Column(
                  children: [
                    Text(
                      'Chỉ số BMI: $result',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Phân loại: $category',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
