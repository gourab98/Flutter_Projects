import 'package:flutter/material.dart';

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
