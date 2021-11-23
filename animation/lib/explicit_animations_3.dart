import 'package:flutter/material.dart';

class AnimationScreen3 extends StatefulWidget {
  AnimationScreen3({Key? key}) : super(key: key);

  @override
  _AnimationScreen3State createState() => _AnimationScreen3State();
}

class _AnimationScreen3State extends State<AnimationScreen3>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 12.0).animate(_animationController!);
    _animationController?.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(108),
          onTap: () {},
          child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, _) {
                return Ink(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      for (int i = 1; i < 2; i++)
                        BoxShadow(
                          color:
                              Colors.white.withOpacity(_animation!.value / 2),
                          spreadRadius: i * _animation!.value,
                        ),
                    ],
                  ),
                  child: Icon(
                    Icons.monetization_on,
                    color: Colors.blueGrey,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
