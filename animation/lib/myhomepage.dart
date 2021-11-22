import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _bigger = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    controller.forward().then((_) async {
      await Future.delayed(Duration(seconds: 1));
      controller.reverse();
      return;
    });
  }

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
              duration: Duration(seconds: 2),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bigger = !_bigger;
                });
              },
              child: AnimatedContainer(
                child: AnimatedIcon(
                  icon: AnimatedIcons.pause_play,
                  progress: controller,
                  size: _bigger ? 20 : 80,
                ),
                height: _bigger ? 30 : 120,
                width: _bigger ? 30 : 120,
                duration: Duration(seconds: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
