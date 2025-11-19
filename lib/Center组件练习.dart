import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Center示例",
      home: Scaffold(
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text("Hello Center"),
          ),
        ),
      ),
    );
  }
}
