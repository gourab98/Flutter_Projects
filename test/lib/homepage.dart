import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 4.0,
          titleTextStyle: TextStyle(
              fontFamily: 'ArchitectsDaughter',
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Note Pad")),
        ),
        body: Container(child: Text("I am ")),
      ),
    );
  }
}
