import 'package:flutter/material.dart';

void main() {
  runApp(testApp());
}

// ignore: camel_case_types
class testApp extends StatelessWidget {
  const testApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Text('$Color._value(1)'),
      ),
    );
  }
}

class Color {
  final int value;
  const Color._value(this.value);

  static const Color WHITE = const Color._value(0);
  static const Color BLACK = const Color._value(1);
}
