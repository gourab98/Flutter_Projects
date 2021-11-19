import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Animation Home Page'),
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
  bool _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              width: _bigger ? 100 : 400,
              child: Image.asset("images/2880.jpg"),
              duration: Duration(milliseconds: 500),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bigger = !_bigger;
                });
              },
              child: Icon(Icons.star),
            )
          ],
        ),
      ),
    );
  }
}
