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

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 6,
          padding: EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(15),
              child: Stack(
                children: <Widget>[
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 36),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            colors: [Color(0xFF213B6C), Color(0xFF0059A5)]),
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
                                  'ListDemo',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                  ),
                                ),
                                Text(
                                  'List is a very useful element in flutter!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            size: 36,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 20,
                    child: Icon(
                      Icons.star,
                      size: 32,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class GridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.wifi,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Wifi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.network_cell,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Network',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.green,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.devices,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Connected Devices',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.alarm,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 20.0,
            ),
            Card(
              color: Colors.blue,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.wifi,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Wifi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.yellow,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.network_cell,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Network',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.green,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.devices,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Connected Devices',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.alarm,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
