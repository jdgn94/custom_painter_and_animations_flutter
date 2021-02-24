import 'package:flutter/material.dart';

import 'package:custom_painter/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          percentage += 10;
          if (percentage > 100) percentage = 0;
          setState(() {});
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              radialContainer(
                Colors.blue,
                Colors.grey,
                10.0,
                4.0,
                true,
                false,
              ),
              radialContainer(
                Colors.purple,
                Colors.green,
                10.0,
                14.0,
                true,
                true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container radialContainer(
    Color primaryColor,
    Color secondaryColor,
    double primaryWidth,
    double secondaryWidth,
    bool round,
    bool percentageIndicator,
  ) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .5 - 30,
      height: size.width * .5 - 30,
      child: RadialProgress(
        percentage: percentage,
        primaryWidth: primaryWidth,
        secondaryWidth: secondaryWidth,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        round: round,
        percentageIndicator: percentageIndicator,
      ),
    );
  }
}
