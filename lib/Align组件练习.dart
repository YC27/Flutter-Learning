import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Align示例",
      home: Scaffold(
        body: Align(
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(Icons.star, size: 50, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
