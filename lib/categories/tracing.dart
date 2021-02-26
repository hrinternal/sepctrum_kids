import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TracingScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TracingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(children: <Widget>[
        Container(
          color: Colors.red,
          width: 400,
          height: 400,
          child: CustomPaint(
            painter: OpenPainter(),
          ),
        ),
      ]),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 10;
    //list of points
    var points = [Offset(50, 50),
      Offset(80, 70),
      Offset(380, 175),
      Offset(200, 175),
      Offset(150, 105),
      Offset(300, 75),
      Offset(320, 200),
      Offset(89, 125)];
    //draw points on canvas
    canvas.drawPoints(PointMode.points, points, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}