import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Animate a page route transition')),
          ),
          body: Center(
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(_createRouting());
                  },
                  child: const Text(
                    "Are you ready to answer?",
                    textScaleFactor: 1.25,
                  )),
            ),
          ),
        ));
  }
}

Route _createRouting() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return const NewPage();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubic;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          Text(
            "When the world will be destroyed?",
            textScaleFactor: 1.90,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Testing("I know the answer."),
          Testing("I  don't know the answer."),
          Testing("I know nothing."),
          Testing("I will find it out."),
        ],
      )),
    );
  }
}

class Testing extends StatefulWidget {
  final String name;
  const Testing(this.name, {Key? key}) : super(key: key);
  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  var checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checkBox,
          onChanged: (value) {
            checkBox = !checkBox;
            setState(() {});
          },
        ),
        Text(
          widget.name,
          style: const TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 25,
              wordSpacing: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
