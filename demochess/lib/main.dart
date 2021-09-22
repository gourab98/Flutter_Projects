//import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart' as cb;
//import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
//      home: CollapsingList(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color check(int num) {
    if ((num >= 8 && num <= 15) ||
        (num >= 24 && num <= 31) ||
        (num >= 40 && num <= 47) ||
        (num >= 56 && num <= 63)) {
      num++;
    }
    if (num % 2 == 0) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(widget.title),
        title: Text('Go On'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 8,
          children: List.generate(64, (index) {
            return Container(
              child: Center(
                child: Container(
                  child: Text('$index'),
                  color: Colors.white,
                ),
              ),
              color: check(index),
            );
          }),
        ),
      ),
    );
  }
}

//After My App(StatelessWidget Class)
/*

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader(
    Widget page,
    String headerText,
    double minHeight,
    double maxHeight,
    Color color,
  ) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        // child: Container(
        //   color: Colors.red,
        //   child: AspectRatio(
        //     aspectRatio: 1,
        //     child: MyHomePage(title: 'Grid_Test'),
        //   ),
        // ),
//        child: MyHomePage(title: 'What Is Going ON!!'),
        child: Center(child: MyHomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
//        makeHeader(MyHomePage(title: 'GridTest'), 'GridTesting', 200, 500,Colors.pinkAccent),
        makeHeader(MyHomePage(), 'GridTesting', 200, 500, Colors.pinkAccent),

        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              height: 1000,
              color: Colors.yellow,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text('TOP'),
                    Text('MIDDLE'),
                    Text('BOTTOM'),
                  ]))),
        ]))
      ],
    );
  }
}

*/
