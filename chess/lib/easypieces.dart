import 'package:flutter/material.dart';

class EasyPiece extends StatelessWidget {
  final String piece;
  final String color;

  EasyPiece({this.color, this.piece});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Image.asset('lib/images/' + piece + color + '.png'),
    );
  }
}
