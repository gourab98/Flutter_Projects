import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(16),
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
              child: Row(
                children: <Widget>[
                  FlutterLogo(size: 48),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Flutter RowDemo',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 16),
                        Text("Isn't it a good example?",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.air_sharp,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
