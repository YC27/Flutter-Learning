import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Center(
        child: MaterialApp(
          title: "Flutter 第二天",
          home: Scaffold(
            appBar: AppBar(title: const Center(child: Text("顶部区域"))),
            body: const Center(child: Text("中间区域")),
            bottomNavigationBar: const SizedBox(
              height: 80,
              child: Center(child: Text("底部区域")),
            ),
          ),
        ),
      ),
    );
  }
}
