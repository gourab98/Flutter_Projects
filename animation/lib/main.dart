import 'package:animation/tween_example.dart';
import 'package:animation/tween_example1.dart';
import 'package:flutter/material.dart';

import 'package:animation/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Test',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
//      home: const MyHomePage(title: 'Flutter Animation Home Page'),
//      home: const TweenExample1(),
      home: const TweenExample2(),
    );
  }
}
