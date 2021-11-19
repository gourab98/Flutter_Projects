import 'package:flutter/material.dart';

class MyPiece extends StatelessWidget {
  // pawn, rook, knight, bishop, queen, king, x (blank), o (available move)
  final String piece;

  // possible kill move
  final String killMove;

  // black, white
  final String color;

  // selected, unselected
  final String thisPieceIsSelected;

  // function
  final onTap;

  MyPiece(
      {this.piece,
      this.color,
      this.onTap,
      this.thisPieceIsSelected,
      this.killMove});

  @override
  Widget build(BuildContext context) {
    // possible kill move
    if (killMove == 'k') {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.red[200],
            padding: EdgeInsets.all(5),
            child: Image.asset('lib/images/' + piece + color + '.png'),
          ),
        ),
      );
    }

    // available positions
    else if (piece == 'o') {
      return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            color: Colors.green[200],
          ),
        ),
      );
    }

    // x is blank, !x there exists a piece there
    else if (piece != 'x') {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          color: thisPieceIsSelected == 'selected'
              ? Colors.green[200]
              : Colors.transparent,
          padding: EdgeInsets.all(10),
          child: Image.asset('lib/images/' + piece + color + '.png'),
        ),
      );
    }

    // if 'x' then return blank container
    return Container();
  }
}
