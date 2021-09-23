import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart'
    as cb;

import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChessGame Demo',
      home: CollapsingList(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    this.minHeight,
    this.maxHeight,
    this.child,
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
        makeHeader(HomePage(), 'GridTesting', 200, 700, Colors.pinkAccent),
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    final size = min(viewport.height, viewport.width);

    return Scaffold(
      appBar: AppBar(
        title: Text("Random Chess"),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: cb.Chessboard(
            fen: _fen,
            size: size,
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
      ),
    );
  }
}
