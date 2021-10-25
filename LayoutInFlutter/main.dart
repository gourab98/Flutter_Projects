import 'package:flutter/material.dart';
import 'column.dart';
import 'row.dart';
import 'stack.dart';
import 'container.dart';
import 'list.dart';
import 'gridlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//        home: ColumnDemo(),
//        home: RowDemo(),
//        home: StackDemo(),
//        home: ContainerDemo(),
//        home: ListDemo(),
      home: GridDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
