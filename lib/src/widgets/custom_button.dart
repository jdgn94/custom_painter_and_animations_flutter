import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final IconData arrowIcon;
  final String title;
  final Color primary;
  final Color secondary;
  final Color textColor;
  final Function onPress;

  CustomButton({
    @required this.icon,
    @required this.title,
    @required this.onPress,
    this.primary = Colors.grey,
    this.secondary = Colors.blueGrey,
    this.textColor = Colors.white,
    this.arrowIcon = FontAwesomeIcons.chevronRight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CustomButtonBackground(icon, primary, secondary, textColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140, width: 40),
            FaIcon(
              icon,
              color: textColor,
              size: 40,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: textColor, fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            FaIcon(
              arrowIcon,
              color: textColor,
            ),
            SizedBox(width: 40),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          height: 100,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: Colors.white10,
              onTap: onPress,
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color primary;
  final Color secondary;
  final Color textColor;

  const _CustomButtonBackground(
    this.icon,
    this.primary,
    this.secondary,
    this.textColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          primary,
          secondary,
        ]),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: textColor.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
