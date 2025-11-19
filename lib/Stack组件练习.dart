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
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Container(width: 200, height: 200, color: Colors.grey),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
              Positioned(
                top: 200,
                right: 0,
                left: 0,
                child: Container(width: 50, height: 50, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
