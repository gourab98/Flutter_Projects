import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Stack(
              children: <Widget>[
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 60),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 10,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.green,
                            Colors.blue,
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow,
                          blurRadius: 50,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlutterLogo(size: 48),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Container Demo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text('Container is very useful',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.white)),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.content_copy,
                          size: 36,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Icon(
                    Icons.ac_unit,
                    size: 32,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
