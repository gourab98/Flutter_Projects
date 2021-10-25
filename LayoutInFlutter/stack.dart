import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Stack(
//          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: 500,
              alignment: Alignment.bottomCenter,
              color: Colors.green,
            ),
            Container(
              height: 400,
              width: 400,
              color: Colors.deepPurpleAccent,
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.lime,
            ),
            Container(
              child: Center(
                child: Text(
                  'StackDemo!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: 700.0,
              width: 200.0,
              color: Colors.tealAccent,
            ),
          ],
        ),
      ),
    );
  }
}
