import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Table",
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.redAccent),
        backgroundColor: Colors.blueAccent,
      ),
      home: Table(),
    );
  }
}

class Table extends StatefulWidget {
  Table({Key? key}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<Table> {
  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String num = "";
  int number = 0;
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Number Finder Table"),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: ListView(
            children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(
                    labelStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    labelText: "Please Enter a number for the table:"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(4),
                color: Colors.transparent,
                child: ElevatedButton(
                  child: Container(
                    child: Text(
                      "Show",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         content: Text(myController.text),
                    //       );
                    //     });
                    setState(() {
                      num = myController.text;
                      number = int.parse(num);
                      i = 1;
                    });
                  },
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    "The number is : $number",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              for (i; i <= 20; i++) Text(" $i X $number = ${i * number}"),
            ],
          ),
        ),
      ),
    );
  }
}
