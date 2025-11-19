import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Padding示例",
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 2,
                child: Container(height: 100, color: Colors.red),
              ),
              Expanded(
                flex: 1,
                child: Container(height: 100, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
