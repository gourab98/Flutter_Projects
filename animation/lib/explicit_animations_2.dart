import 'package:flutter/material.dart';

class AnimationScreen2 extends StatefulWidget {
  AnimationScreen2({Key? key}) : super(key: key);

  @override
  _AnimationScreen2State createState() => _AnimationScreen2State();
}

class _AnimationScreen2State extends State<AnimationScreen2>
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
      appBar: AppBar(
        title: Text("Explicit Animations"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
              heightFactor: 1.6,
              child: RotationTransition(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                ),
                alignment: Alignment.center,
                turns:
                    Tween<double>(begin: 0, end: 1).animate(_curveAnimation!),
              ),
            ),
            Text(
              "The current value is $currentValue",
              style: TextStyle(fontSize: 26),
            ),
            Container(
              height: 200,
              child: FloatingActionButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
