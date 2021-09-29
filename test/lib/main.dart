import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    var myDrawer = Container(color: Colors.blue);
    var myChild = Container(color: Colors.yellow);
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            myDrawer,
            Transform(
              transform: Matrix4.identity()
//              ..translate()
                ..scale(0.5),
              alignment: Alignment.centerLeft,
              child: myChild,
            )
          ],
        ),
      ),
    );
  }
}
