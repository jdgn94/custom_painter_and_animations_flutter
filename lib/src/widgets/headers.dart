import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // lapiz para dibujar

    // propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // fill: pinta todo el cuarado, stroke: solo dibuja la linea
    paint.strokeWidth = 5.0;

    final path = new Path();

    path.moveTo(0, size.height * .35);
    path.lineTo(size.width, size.height * .3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // lapiz para dibujar

    // propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // fill: pinta todo el cuarado, stroke: solo dibuja la linea
    paint.strokeWidth = 5.0;

    final path = new Path();

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // lapiz para dibujar

    // propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // fill: pinta todo el cuarado, stroke: solo dibuja la linea
    paint.strokeWidth = 5.0;

    final path = new Path();

    path.lineTo(0, size.height * .2);
    path.lineTo(size.width * .5, size.height * .3);
    path.lineTo(size.width, size.height * .2);
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // lapiz para dibujar

    // propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // fill: pinta todo el cuarado, stroke: solo dibuja la linea
    paint.strokeWidth = 5.0;

    final path = new Path();

    path.lineTo(0, size.height * .2);
    path.quadraticBezierTo(
      size.width * .5,
      size.height * .4,
      size.width,
      size.height * .2,
    );
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * .2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); // lapiz para dibujar

    // propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // fill: pinta todo el cuarado, stroke: solo dibuja la linea
    paint.strokeWidth = 5.0;

    final path = new Path();

    path.lineTo(0, size.height * .2);
    path.quadraticBezierTo(
      size.width * .25,
      size.height * .25,
      size.width * .5,
      size.height * .2,
    );
    path.quadraticBezierTo(
      size.width * .75,
      size.height * .15,
      size.width,
      size.height * .2,
    );
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * .2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWavesGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Color(0xff6D05E8), Color(0xffC012FF), Color(0xff6D05FA)],
      stops: [0.3, 0.5, 0.8],
    );

    final Rect rect =
        new Rect.fromCircle(center: Offset(165.0, 55.0), radius: 180);

    final paint = Paint()
      ..shader = gradient.createShader(rect); // lapiz para dibujar

    // propiedades
    paint.style = PaintingStyle.fill;
    // fill: pinta todo el cuarado, stroke: solo dibuja la linea
    paint.strokeWidth = 5.0;

    final path = new Path();

    path.lineTo(0, size.height * .2);
    path.quadraticBezierTo(
      size.width * .25,
      size.height * .25,
      size.width * .5,
      size.height * .2,
    );
    path.quadraticBezierTo(
      size.width * .75,
      size.height * .15,
      size.width,
      size.height * .2,
    );
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * .2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
