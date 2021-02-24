import 'dart:math' as Math;
import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RegtangleAnimate(),
    ));
  }
}

class RegtangleAnimate extends StatefulWidget {
  const RegtangleAnimate({
    Key key,
  }) : super(key: key);

  @override
  _RegtangleAnimateState createState() => _RegtangleAnimateState();
}

class _RegtangleAnimateState extends State<RegtangleAnimate>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _rotation;
  Animation<double> _fateIn;
  Animation<double> _fateOut;
  Animation<double> _moveRight;
  Animation<double> _upper;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    _rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack));

    _fateIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    _fateOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.75, 1, curve: Curves.easeOut)));

    _moveRight = Tween(begin: 0.0, end: 260.0).animate(_controller);

    _upper = Tween(begin: 0.0, end: 2.0).animate(_controller);

    _controller.addListener(() {
      // print('status: ${_controller.status}');
      // if (_controller.status == AnimationStatus.completed)
      //   _controller.reverse();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();

    return AnimatedBuilder(
      animation: _controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(_moveRight.value, 0),
          child: Transform.rotate(
            angle: _rotation.value,
            child: Opacity(
              opacity: _fateIn.value - _fateOut.value,
              child: Transform.scale(
                scale: _upper.value,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
