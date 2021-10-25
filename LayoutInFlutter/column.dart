import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlutterLogo(size: 48),
                  SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Flutter ColumnDemo',
//                      style: (Theme.of(context).textTheme.headline5),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                      'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
