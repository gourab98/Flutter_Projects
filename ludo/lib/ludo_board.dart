import 'package:flutter/material.dart';

class LudoBoard extends StatefulWidget {
  final String colorName;
  final String playerName;
//  const LudoBoard({required String colorName, required String playerName});
  const LudoBoard({
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          double sizeHeight = constraints.maxHeight;
          double sizeWeight = constraints.maxWidth;
          Size size = Size(sizeHeight, sizeWeight);
          double boardSize = size.height;
          double pieceSize = size.height / 15;

          return SafeArea(
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
                              //child: Text("$index"),
                            ),
                          );
                        },
                      ),
                    ),
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterLeftUp(),
                    ),
                    ludoPiece(
                        left: boardSize * (1 / 15),
                        top: boardSize * (1 / 15),
                        pieceSize: pieceSize,
                        color: Colors.green.shade300),
                    ludoPiece(
                        left: boardSize * (4 / 15),
                        top: boardSize * (1 / 15),
                        pieceSize: pieceSize,
                        color: Colors.green.shade300),
                    ludoPiece(
                        left: boardSize * (1 / 15),
                        top: boardSize * (4 / 15),
                        pieceSize: pieceSize,
                        color: Colors.green.shade300),
                    ludoPiece(
                        left: boardSize * (4 / 15),
                        top: boardSize * (4 / 15),
                        pieceSize: pieceSize,
                        color: Colors.green.shade300),
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterRightUp(),
                    ),
                    ludoPiece(
                        left: boardSize * (10 / 15),
                        top: boardSize * (1 / 15),
                        pieceSize: pieceSize,
                        color: Colors.yellow.shade300),
                    ludoPiece(
                        left: boardSize * (13 / 15),
                        top: boardSize * (1 / 15),
                        pieceSize: pieceSize,
                        color: Colors.yellow.shade300),
                    ludoPiece(
                        left: boardSize * (10 / 15),
                        top: boardSize * (4 / 15),
                        pieceSize: pieceSize,
                        color: Colors.yellow.shade300),
                    ludoPiece(
                        left: boardSize * (13 / 15),
                        top: boardSize * (4 / 15),
                        pieceSize: pieceSize,
                        color: Colors.yellow.shade300),
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterLeftDown(),
                    ),
                    ludoPiece(
                        left: boardSize * (1 / 15),
                        top: boardSize * (10 / 15),
                        pieceSize: pieceSize,
                        color: Colors.red.shade300),
                    ludoPiece(
                        left: boardSize * (4 / 15),
                        top: boardSize * (10 / 15),
                        pieceSize: pieceSize,
                        color: Colors.red.shade300),
                    ludoPiece(
                        left: boardSize * (1 / 15),
                        top: boardSize * (13 / 15),
                        pieceSize: pieceSize,
                        color: Colors.red.shade300),
                    ludoPiece(
                        left: boardSize * (4 / 15),
                        top: boardSize * (13 / 15),
                        pieceSize: pieceSize,
                        color: Colors.red.shade300),
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterRightDown(),
                    ),
                    ludoPiece(
                        left: boardSize * (10 / 15),
                        top: boardSize * (10 / 15),
                        pieceSize: pieceSize,
                        color: Colors.blue.shade300),
                    ludoPiece(
                        left: boardSize * (13 / 15),
                        top: boardSize * (10 / 15),
                        pieceSize: pieceSize,
                        color: Colors.blue.shade300),
                    ludoPiece(
                        left: boardSize * (10 / 15),
                        top: boardSize * (13 / 15),
                        pieceSize: pieceSize,
                        color: Colors.blue.shade300),
                    ludoPiece(
                        left: boardSize * (13 / 15),
                        top: boardSize * (13 / 15),
                        pieceSize: pieceSize,
                        color: Colors.blue.shade300),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyPainterLeftUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final left = 0.0;
    final top = 0.0;
    final right = (size.width) * 6 / 15;
    final bottom = (size.height) * 6 / 15;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paint = Paint()
      ..color = Colors.green.shade800
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MyPainterRightUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final left = (size.height) * 9 / 15;
    final top = 0.0;
    final right = size.width;
    final bottom = (size.height) * 6 / 15;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paint = Paint()
      ..color = Colors.yellow.shade800
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MyPainterLeftDown extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final left = 0.0;
    final top = (size.height) * 9 / 15;
    final right = (size.width) * 6 / 15;
    final bottom = size.height;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paint = Paint()
      ..color = Colors.red.shade800
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MyPainterRightDown extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final left = (size.height) * 9 / 15;
    final top = (size.height) * 9 / 15;
    final right = size.width;
    final bottom = size.height;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    final paint = Paint()
      ..color = Colors.blue.shade800
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
    // print("The height is ${size.height}");
    // print("The width is ${size.width}");
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

Widget ludoPiece(
    {required double left,
    required double top,
    required double pieceSize,
    required Color color}) {
  return Positioned(
    left: left,
    top: top,
    child: Container(
      height: pieceSize,
      width: pieceSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(200.0)),
      ),
    ),
  );
}
