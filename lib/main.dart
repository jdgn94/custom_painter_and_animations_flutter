import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/sliver_list_page.dart';
// import 'package:custom_painter/src/pages/emergency_page.dart';
// import 'package:custom_painter/src/pages/pinterest_page.dart';
// import 'package:custom_painter/src/pages/slideshow_page.dart';
// import 'package:custom_painter/src/pages/graficas_circulares_page.dart';
// import 'package:custom_painter/src/lab/cicular_progres_page.dart';
// import 'package:custom_painter/src/challenges/cuadrado_animado_page.dart';
// import 'package:custom_painter/src/pages/animations_page.dart';
// import 'package:custom_painter/src/pages/headers_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SliverListPage(),
    );
  }
}
