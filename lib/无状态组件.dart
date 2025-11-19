import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: "Flutter 第二天",

      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("顶部区域"))),
        body: Center(child: Text("中间区域")),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Center(child: Text("底部区域")),
        ),
      ),
    );
  }
}
