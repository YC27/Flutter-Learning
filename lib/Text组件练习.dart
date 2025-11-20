import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wrap示例",
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              "Hello, Flutter!,Hello, Flutter!,Hello, Flutter!,Hello, Flutter!,Hello, Flutter!",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
                decorationColor: Colors.orange,
                decorationThickness: 2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
