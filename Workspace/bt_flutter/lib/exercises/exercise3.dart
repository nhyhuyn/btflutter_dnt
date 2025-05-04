import 'package:flutter/material.dart';

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiCard')),
      body: Center(
        child: Card(
          elevation: 8,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar (hình ảnh đại diện)
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/avatar.jpg',
                  ), 
                ),
                const SizedBox(height: 10),
                Text(
                  'Huỳnh Thị Nhị',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                // Nghề nghiệp
                Text(
                  'IT',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                // Thông tin liên hệ
                Text(
                  'Email: nhihthiht.22ite@vku.udn.vn',
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  'Phone: 0123456789',
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}