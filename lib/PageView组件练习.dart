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
  int _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "示例",
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _controller,
                        itemCount: 10,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder:
                            (final BuildContext context, final int index) {
                              return Container(
                                height: 300,
                                width: double.infinity,
                                alignment: Alignment.center,
                                color: Colors.blue,
                                child: Text(
                                  "轮播图$index",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                ),
                              );
                            },
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(10, (index) {
                              return GestureDetector(
                                onTap: () {
                                  _controller.animateToPage(
                                    index,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.linear,
                                  );
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: _currentIndex == index
                                        ? Colors.red
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPersistentHeader(delegate: _StickyType(), pinned: true),
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                ),
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    alignment: Alignment.center,
                    child: Text("$index"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StickyType extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 100,
      itemBuilder: (final BuildContext context, final int index) {
        return Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          width: 100,
          height: 60,
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text("$index", style: TextStyle(color: Colors.white)),
        );
      },
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
