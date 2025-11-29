import 'package:demo_flutter/model/Channel.dart';
import 'package:demo_flutter/utils/dio_util.dart';
import 'package:dio/dio.dart';
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
  List<Channel> channels = [];

  @override
  void initState() {
    super.initState();

    _getChannels();
  }

  void _getChannels() async {
    final Response res = await DioUtils().get("channels");
    final data = res.data["data"]["channels"];

    setState(() {
      channels = (data as List).map((e) => Channel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _ChildPage(
          list: channels,
          del: (index) {
            channels.removeAt(index);
          },
        ),
      ),
    );
  }
}

class _ChildPage extends StatefulWidget {
  final List<Channel> list;
  final Function(int index) del;

  const _ChildPage({required this.list, required this.del});

  @override
  State<_ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<_ChildPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
      ),
      itemCount: widget.list.length,
      itemBuilder: (final BuildContext context, final int index) {
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.blue,
              margin: EdgeInsets.all(5),
              child: Text(widget.list[index].name),
            ),
            Positioned(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.del(index);
                  });
                },
                icon: Icon(Icons.delete, size: 10),
              ),
            ),
          ],
        );
      },
    );
  }
}
