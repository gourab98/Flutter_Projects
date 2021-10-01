import 'package:flutter/material.dart';
import 'types.dart' as types;
import 'square.dart';
import 'chess_piece.dart';

class ChessSquare extends StatelessWidget {
  final String name;
  final Color color;
  final double size;
  final types.Piece piece;
  final void Function(types.ShortMove move) onDrop;
  final void Function(types.HalfMove move) onClick;
  final bool highlight;

  ChessSquare({
    this.name,
    @required this.color,
    @required this.size,
//    this.size,
    this.highlight = true,
    this.piece,
    this.onDrop,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<types.HalfMove>(
      onWillAccept: (data) {
        return data.square != name;
      },
      onAccept: (data) {
//        print('The size is-------- $size');
        if (onDrop != null) {
          onDrop(types.ShortMove(
            from: data.square,
            to: name,
            promotion: types.PieceType.QUEEN,
          ));
        }
      },
      builder: (context, candidateData, rejectedData) {
        return InkWell(
          onTap: () {
            if (onClick != null) {
              onClick(types.HalfMove(name, piece));
            }
          },
          child: Square(
            size: size,
            color: color,
            highlight: highlight,
            child: piece != null
                ? ChessPiece(
                    squareName: name,
                    squareColor: color,
                    piece: piece,
                    size: size,
                  )
                : null,
          ),
        );
      },
    );
  }
}
