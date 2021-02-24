import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({Key key}) : super(key: key);

  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _moveRight;
  Animation<double> _moveTop;
  Animation<double> _moveLeft;
  Animation<double> _moveBottom;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    _moveRight = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));

    _moveTop = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));

    _moveLeft = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));

    _moveBottom = Tween(begin: 0.0, end: 150.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    _controller.addListener(() {
      if (_controller.isCompleted) _controller.reset();
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
    _controller.forward();

    return AnimatedBuilder(
        animation: _controller,
        child: _Rectangle(),
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(_moveRight.value - _moveLeft.value,
                _moveBottom.value - _moveTop.value),
            child: child,
          );
        });
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
