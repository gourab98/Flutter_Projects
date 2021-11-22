import 'package:flutter/material.dart';

class TweenExample2 extends StatefulWidget {
  const TweenExample2({Key? key}) : super(key: key);

  @override
  _TweenExample2State createState() => _TweenExample2State();
}

class _TweenExample2State extends State<TweenExample2> {
  final Image starsBackground = Image.asset(
    'images/space.jpg',
    fit: BoxFit.cover,
    height: 1000,
    width: 1000,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
//        starsBackground,
        Background(),
        Center(
          child: TweenAnimationBuilder<Color>(
            tween: Tween(begin: Colors.white, end: Colors.orange),
            duration: Duration(seconds: 2),
            builder: (_, Color color, __) {
              return ColorFiltered(
                child: Image.asset('images/sun.png'),
                colorFilter: ColorFilter.mode(color, BlendMode.modulate),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/space.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
