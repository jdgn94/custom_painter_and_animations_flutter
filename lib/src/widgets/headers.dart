import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primary;
  final Color secondary;
  final Color textColor;

  IconHeader({
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    this.primary = Colors.grey,
    this.secondary = Colors.blueGrey,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _IconHeaderBackground(primary, secondary),
        _IconHeaderPlusOpacity(icon, textColor),
        _IconHeaderText(title, subtitle, icon, textColor)
      ],
    );
  }
}

class _IconHeaderText extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color textColor;

  const _IconHeaderText(
    this.title,
    this.subtitle,
    this.icon,
    this.textColor,
  );

  @override
  Widget build(BuildContext context) {
    final Color textColorOpacity = textColor.withOpacity(0.7);
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: double.infinity,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: textColorOpacity,
          ),
        ),
        SizedBox(height: 20),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: textColorOpacity,
          ),
        ),
        SizedBox(height: 20),
        FaIcon(
          icon,
          size: 80,
          color: textColor,
        ),
      ],
    );
  }
}

class _IconHeaderPlusOpacity extends StatelessWidget {
  final Color textColor;
  final IconData icon;

  _IconHeaderPlusOpacity(
    this.icon,
    this.textColor,
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: -70,
      child: FaIcon(
        icon,
        size: 250,
        color: textColor.withOpacity(0.2),
      ),
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color primary;
  final Color secondary;

  _IconHeaderBackground(
    this.primary,
    this.secondary,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primary,
            secondary,
          ],
        ),
      ),
    );
  }
}
