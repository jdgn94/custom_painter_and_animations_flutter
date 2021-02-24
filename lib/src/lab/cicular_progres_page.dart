import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    controller.addListener(() {
      // print('valor controller: ${controller.value}');

      percentage = lerpDouble(percentage, newPercentage, controller.value);
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
              painter: _RadialCircularProgress(percentage: percentage)),
        ),
      ),
    );
  }
}

class _RadialCircularProgress extends CustomPainter {
  _RadialCircularProgress({@required this.percentage});

  final double percentage;
  @override
  void paint(Canvas canvas, Size size) {
    // circula inicial
    final paintCircle = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * .5, size.height / 2);
    final radius = min(size.width / 2, size.height * .5);

    canvas.drawCircle(center, radius, paintCircle);

    // arco
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //parte que se debe ir llenando
    double arcAngle = 2 * pi * (percentage / 100);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = -pi / 2;

    canvas.drawArc(rect, startAngle, arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
