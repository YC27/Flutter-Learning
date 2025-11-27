import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: _ChildPage(len: 5)));
  }
}

class _ChildPage extends StatelessWidget {
  final int len;

  const _ChildPage({required this.len});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemCount: len,
      itemBuilder: (final BuildContext context, final int index) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "a",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
