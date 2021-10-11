import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Set State Demo',
      theme: ThemeData.light().copyWith(primaryColor: Colors.red),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.blue,
        title: Center(child: Text('Experiments')),
      ),
      // backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                counter++;
                setState(() {});
              },
              child: Text('The counter is : $counter', textScaleFactor: 2.00),
            ),
            SizedBox(height: 20),
            ButtonName("Press Here"),
            SizedBox(height: 20),
            ButtonName("Click Here"),
            SizedBox(height: 20),
            ButtonName("Tap Here"),
            DrinkWidget('Water'),
            DrinkWidget('Cocakola'),
          ],
        ),
      ),
    );
  }
}

class ButtonName extends StatelessWidget {
  final String name;
  const ButtonName(this.name);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          name,
          textScaleFactor: 2.34,
        ),
      ),
    );
  }
}

class DrinkWidget extends StatefulWidget {
  final String drinkName;

  const DrinkWidget(this.drinkName);

  @override
  _DrinkWidgetState createState() => _DrinkWidgetState();
}

class _DrinkWidgetState extends State<DrinkWidget> {
  var checkBox = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checkBox,
            onChanged: (value) {
              setState(() {
                if (checkBox == false) {
                  checkBox = true;
                } else
                  checkBox = false;
              });
              print(checkBox);
            }),
        Text(widget.drinkName),
      ],
    );
  }
}
