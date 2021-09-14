import 'package:flutter/material.dart';
import 'dart:math' as math;

//import 'package:flutter/src/painting/image_resolution.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CollapsingList(),
      ),
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
    Image img,
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
          color: color,
          child: Center(
            // child: Text(
            //   headerText,
            //   style: TextStyle(color: Colors.white),
            // ),
            child: Image(image: AssetImage('assets/sam-photo.jpg')),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // Container(
        //   child: Image(
        //     image: AssetImage('assets/sam-photo.jpg'),
        //     fit: BoxFit.fill,
        //   ),
        // ),

//        makeHeader('Pinned', 100, 100, Colors.blue),
//        makeHeader('Floating', 0, 250, Colors.green),
        makeHeader(Image(image: AssetImage('assets/sam-photo.jpg')),
            'Please Run', 100, 400, Colors.green),

        SliverList(
            delegate: SliverChildListDelegate([
          // Container(
          //   child: Image(
          //     image: AssetImage('assets/sam-photo.jpg'),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Container(
              height: 2000,
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




/*

import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _title = "I am nobody";

  var backgroundColor;

  get mainAxisAlignment => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _title = "I am Supreme. $_counter";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('Pinned App Bar'),
          ),
          SliverPersistentHeader(
            floating: false,
            delegate: FloatingHeader(),
          ),
          Container(
            child: AspectRatio(
              aspectRatio: 1,
              child: Image(
                height: 300,
                width: 300,
                image: AssetImage('assets/sam-photo.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 2000,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TOP'),
                  Text('MIDDLE'),
                  Text('BOTTOM'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_sharp),
      ),
    );
  }
}

class FloatingHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      child: Center(
          child:
              Text('Floating Header', style: TextStyle(color: Colors.white))),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => 80.0;
}

*/