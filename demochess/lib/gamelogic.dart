import 'package:demochess/chess_square.dart';
import 'utils.dart';
import 'package:flutter/material.dart';
import 'types.dart' as types;

export 'types.dart';

class Chessboard extends StatefulWidget {
  final String fen;
  final types.Color orientation;
  final void Function(types.ShortMove move) onMove;
  final Color lightSquareColor;
  final Color darkSquareColor;

  Chessboard({
    this.fen,
    this.orientation = types.Color.WHITE,
    this.onMove,
    this.lightSquareColor = const Color.fromRGBO(0, 0, 255, 1),
    this.darkSquareColor = const Color.fromRGBO(255, 255, 255, 1),
  });

  @override
  _ChessboardState createState() => _ChessboardState();
}

class _ChessboardState extends State<Chessboard> {
  types.HalfMove _clickMove;

  // Color check(int num) {
  //   if ((num >= 8 && num <= 15) ||
  //       (num >= 24 && num <= 31) ||
  //       (num >= 40 && num <= 47) ||
  //       (num >= 56 && num <= 63)) {
  //     num++;
  //   }
  //   if (num % 2 == 0) {
  //     return Colors.white;
  //   } else {
  //     return Colors.black;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final pieceMap = getPieceMap(widget.fen);
    return Scaffold(
      body: Container(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  childAspectRatio: 1,
                ),
                childrenDelegate: SliverChildListDelegate(
                  List.generate(
                    64,
                    (index) {
                      int i = (index ~/ 8);
                      int j = index % 8;
                      double size = double.infinity;
//                      print('The size is-------- $size');
                      final square = getSquare(i, j, widget.orientation);
                      final color =
                          (i + j) % 2 == 0 ? Colors.white : Colors.blue;
                      return ChessSquare(
                        name: square,
                        color: color,
                        size: size,
//                        size: 50,
                        highlight: _clickMove?.square == square,
                        piece: pieceMap[square],
                        onDrop: (move) {
                          if (widget.onMove != null) {
                            widget.onMove(move);
                            setClickMove(null);
                          }
                        },
                        onClick: (halfMove) {
                          if (_clickMove != null) {
                            if (_clickMove.square == halfMove.square) {
                              setClickMove(null);
                            } else if (_clickMove.piece.color ==
                                halfMove.piece?.color) {
                              setClickMove(halfMove);
                            } else {
                              widget.onMove(types.ShortMove(
                                from: _clickMove.square,
                                to: halfMove.square,
                                promotion: types.PieceType.QUEEN,
                              ));
                            }
                            setClickMove(null);
                          } else if (halfMove.piece != null) {
                            setClickMove(halfMove);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setClickMove(types.HalfMove move) {
    setState(() {
      _clickMove = move;
    });
  }
}
