import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:custom_painter/src/widgets/headers.dart';
import 'package:custom_painter/src/widgets/custom_button.dart';

class ItemBoton {
  final IconData icon;
  final String title;
  final Color primary;
  final Color secondary;

  ItemBoton(this.icon, this.title, this.primary, this.secondary);
}

final items = <ItemBoton>[
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
      Color(0xff906EF5)),
  new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
      Color(0xff536CF6)),
  new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      Color(0xffF2D572), Color(0xffE06AA3)),
  new ItemBoton(
      FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
];

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              child: CustomButton(
                title: item.title,
                icon: item.icon,
                primary: item.primary,
                secondary: item.secondary,
                onPress: () {},
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [SizedBox(height: 100), ...itemMap],
            ),
          ),
          PageHeader(),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Haz solicitado',
      subtitle: 'Asistencia Médica',
      primary: Color(0xff526BF6),
      secondary: Color(0xff67ACF2),
      textColor: Colors.white,
    );
  }
}
