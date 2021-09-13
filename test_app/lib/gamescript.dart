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
      home: new Scaffold(
        body: SafeArea(
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // title: Text("ChessBoard Game!",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16.0,
                //     ) //TextStyle
                //     ),
                background: new Center(
                  child: HomePage(),
                ),
              ),
              expandedHeight: 800,
              backgroundColor: Colors.green[200],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                  title: Center(
                    child: Text('Player-> $index',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.greenAccent[400]) //TextStyle
                        ), //Text
                  ), //Center
                ), //ListTile
                childCount: 51,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// To build the unmodified project project.
/*
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChessGame Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue[200],
      // ),
      home: HomePage(),
    );
  }
}

*/

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
    );
  }
}
