import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(),
      home: CollapsingList(),
    );
  }
}

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
        child: Container(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: MyHomePage(),
          ),
        ),
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
              color: Colors.green,
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go to Mars'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
//          shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
