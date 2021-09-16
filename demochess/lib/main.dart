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
        primarySwatch: Colors.green,
      ),
//      home: MyHomePage(title: 'GridTest'),
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
        child: Container(
          child: AspectRatio(
            aspectRatio: 1,
            child: MyHomePage(title: 'GridTest'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // AspectRatio(
        //   aspectRatio: 1,
        //   child: makeHeader(MyHomePage(title: 'Grid_Test'), 'GridTesting', 200,
        //       500, Colors.green),
        // ),
        makeHeader(MyHomePage(title: 'Grid_Test'), 'GridTesting', 200, 500,
            Colors.green),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              height: 1000,
              color: Colors.white,
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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
        title: Text(widget.title),
      ),
      body: GridView.count(
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
    );
  }
}
