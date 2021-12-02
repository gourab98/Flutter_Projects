import 'package:flutter/material.dart';

class LudoBoard extends StatefulWidget {
  final String colorName;
  final String playerName;
//  const LudoBoard({required String colorName, required String playerName});
  LudoBoard({
    required this.colorName,
    required this.playerName,
  });

  @override
  _LudoBoardState createState() => _LudoBoardState();
}

class _LudoBoardState extends State<LudoBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.colorName}  ${widget.playerName}"),
      ),
    );
  }
}
