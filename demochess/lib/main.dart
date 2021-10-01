import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'gamelogic.dart' as cb;
import 'chesslogic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CollapsingList(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
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
        child: Center(child: HomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeHeader(HomePage(), 'GridTesting', 300, 550, Colors.pinkAccent),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              height: 1000,
              color: Colors.deepPurpleAccent,
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DreamAspect Chess"),
      ),
      body: Center(
        child: cb.Chessboard(
          fen: _fen,
          orientation: cb.Color.WHITE,
          onMove: (move) {
            final nextFen = makeMove(_fen, {
              'from': move.from,
              'to': move.to,
              'promotion': 'q',
            });

            if (nextFen != null) {
              setState(() {
                _fen = nextFen;
              });

              Future.delayed(Duration(milliseconds: 300)).then((_) {
                final nextMove = getRandomMove(_fen);

                if (nextMove != null) {
                  setState(() {
                    _fen = makeMove(_fen, nextMove);
                  });
                }
              });
            }
          },
        ),
      ),
    );
  }
}
