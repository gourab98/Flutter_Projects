import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: GestureDetector(
                // behavior: HitTestBehavior.translucent,
                onTap: () {
                  print("1st Time: 1st Time: 1st Time- 1111111111111111");
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "1st",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  height: 200,
                  width: 200,
                  color: Colors.amber,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  print("2nd Time: 2nd Time: 2nd Time - 22222222222222222222");
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "2nd",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  height: 200,
                  width: 200,
                  color: Colors.cyan,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  print("3nd Time: 3nd Time: 3nd Time - 3333333333333333");
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "3nd",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  height: 200,
                  width: 200,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
