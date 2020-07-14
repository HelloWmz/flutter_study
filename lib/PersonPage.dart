import 'dart:ui';

import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('个人中心'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              CustomPaint(
                painter: MyCustomPainter(),
              ),
              CustomPaint(
                painter: LineCustomPainter(),
              ),
            ],
          ),
        ));
  }
}

//https://blog.csdn.net/mengks1987/article/details/106506304
class MyCustomPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = 20.0;
    canvas.drawCircle(Offset(30, 30), radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class LineCustomPainter extends CustomPainter {
  Paint _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(70, 70), Offset(100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
