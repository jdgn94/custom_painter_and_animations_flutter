import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final double primaryWidth;
  final double secondaryWidth;
  final Color primaryColor;
  final Color secondaryColor;
  final bool round;
  final bool percentageIndicator;

  const RadialProgress(
      {Key key,
      @required this.percentage,
      this.primaryWidth = 10,
      this.secondaryWidth = 4,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.round = true,
      this.percentageIndicator = false})
      : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double afterPercentage;

  @override
  void initState() {
    afterPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final difAnimate = widget.percentage - afterPercentage;
    afterPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              widget.percentageIndicator
                  ? Center(
                      child: Text('${widget.percentage} %'),
                    )
                  : Container(),
              Container(
                width: double.infinity,
                height: double.infinity,
                child: CustomPaint(
                  painter: _RadialCircularProgress(
                    (widget.percentage - difAnimate) +
                        (difAnimate * controller.value),
                    widget.primaryWidth,
                    widget.secondaryWidth,
                    widget.primaryColor,
                    widget.secondaryColor,
                    widget.round,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RadialCircularProgress extends CustomPainter {
  final double percentage;
  final double primaryWidth;
  final double secondaryWidth;
  final Color primaryColor;
  final Color secondaryColor;
  final bool round;

  _RadialCircularProgress(
    this.percentage,
    this.primaryWidth,
    this.secondaryWidth,
    this.primaryColor,
    this.secondaryColor,
    this.round,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // circula inicial
    final paintCircle = new Paint()
      ..strokeWidth = secondaryWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * .5, size.height / 2);
    final radius = min(size.width / 2, size.height * .5);

    canvas.drawCircle(center, radius, paintCircle);

    // arco
    final paintArc = new Paint()
      ..strokeWidth = primaryWidth
      ..color = primaryColor
      ..strokeCap = round ? StrokeCap.round : StrokeCap.square
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
