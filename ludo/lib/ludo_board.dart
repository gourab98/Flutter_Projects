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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
//              alignment: Alignment.topCenter,
              children: <Widget>[
                GridView.count(
                  crossAxisCount: 15,
                  childAspectRatio: 1,
                  children: List<Widget>.generate(
                    225,
                    (index) {
                      return GridTile(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
//                          child: Text("$index"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
