import 'dart:math';

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
  final List<int> _list = List.generate(10, (index) {
    return Random().nextInt(1000);
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _ChildMainPage(
          list: _list,
          delFunction: (index) {
            _list.removeAt(index);
          },
        ),
      ),
    );
  }
}

class _ChildMainPage extends StatefulWidget {
  final List<int> list;
  final Function(int index) delFunction;

  const _ChildMainPage({required this.list, required this.delFunction});

  @override
  State<_ChildMainPage> createState() => _ChildMainPageState();
}

class _ChildMainPageState extends State<_ChildMainPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemCount: widget.list.length,
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
                "${widget.list[index]}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Positioned(child: IconButton(onPressed: () {
              setState(() {
                widget.delFunction(index);
              });
            }, icon: Icon(Icons.delete, color: Colors.red)))
          ],
        );
      },
    );
  }
}
