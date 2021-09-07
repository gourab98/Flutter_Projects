import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_stateless_chessboard/flutter_stateless_chessboard.dart'
    as cb;

void main() {
  runApp(ChessApp());
}

class ChessApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: SafeArea(
          child: CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("ChessBoard Game!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ) //TextStyle
                    ),
                background: new Center(
                  child: cb.Chessboard(
                    size: 300,
                    fen:
                        "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
                    onMove: (move) {
                      // optional
                      // ignore: todo
                      // TODO: process the move
                      print("move from ${move.from} to ${move.to}");
                    },
                    orientation: cb.Color.BLACK, // optional
                    lightSquareColor:
                        Color.fromRGBO(240, 217, 181, 1), // optional
                    darkSquareColor:
                        Color.fromRGBO(181, 136, 99, 1), // optional
                  ),
                ),
              ),
              expandedHeight: 400,
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



//Main Chess Board Example:
/*
void main() {
  runApp(
    new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text('Chess Board'),
          ),
          backgroundColor: Colors.greenAccent[400],
        ), //AppBar
        body: new Center(
          child: cb.Chessboard(
            size: 300,
            fen: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1",
            onMove: (move) {
              // optional
              // ignore: todo
              // TODO: process the move
              print("move from ${move.from} to ${move.to}");
            },
            orientation: cb.Color.BLACK, // optional
            lightSquareColor: Color.fromRGBO(240, 217, 181, 1), // optional
            darkSquareColor: Color.fromRGBO(181, 136, 99, 1), // optional
          ),
        ),
      ),
    ),
  );
}

*/