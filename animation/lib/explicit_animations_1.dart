import 'package:flutter/material.dart';

class AnimationScreen1 extends StatefulWidget {
  AnimationScreen1({Key? key}) : super(key: key);

  @override
  _AnimationScreen1State createState() => _AnimationScreen1State();
}

class _AnimationScreen1State extends State<AnimationScreen1>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  double? currentValue;
  Animation<double>? _curveAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _curveAnimation = CurvedAnimation(
        parent: _animationController!, curve: Curves.elasticOut);

    _animationController?.addListener(() {
      setState(() {
        currentValue = _animationController?.value;
      });
    });
    _animationController?.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PositionedTransition(
            child: Container(
              height: 200,
              width: 200,
              decoration: (BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              )),
            ),
            rect: RelativeRectTween(
              begin: RelativeRect.fromLTRB(0, 0, 0, 600),
              end: RelativeRect.fromLTRB(0, 600, 0, 0),
            ).animate(_curveAnimation!),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add_circle),
        onPressed: () {
          if (_animationController!.isAnimating) {
            _animationController!.stop();
          } else {
            _animationController!.repeat();
          }
        },
      ),
    );
  }
}
