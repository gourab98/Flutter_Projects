import 'package:flutter/material.dart';

class TweenExample1 extends StatefulWidget {
  const TweenExample1({Key? key}) : super(key: key);

  @override
  _tweenExample1State createState() => _tweenExample1State();
}
 
// ignore: camel_case_types
class _tweenExample1State extends State<TweenExample1> {
  double value = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double size, Widget? child) {
            return IconButton(
              iconSize: size,
              icon: child!,
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  value = value == 140 ? 240 : 140;
                });
              },
            );
          },
          child: const Icon(Icons.zoom_out),
        ),
      ),
    );
  }
}
