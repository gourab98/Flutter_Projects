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
      body: LayoutBuilder(
        builder: (context, constraints) {
          double sizeHeight = constraints.maxHeight;
          double sizeWeight = constraints.maxWidth;
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
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterRightUp(),
                    ),
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterLeftDown(),
                    ),
                    CustomPaint(
                      size: Size(sizeHeight, sizeWeight),
                      painter: MyPainterRightDown(),
                    ),
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
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
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
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
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
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
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
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
