import 'package:flutter/material.dart';
import 'package:govis/helper.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final int index;
  final PageController controller;
  final int selectedIndex;

  TabButton({
    Key key,
    this.icon,
    this.text,
    this.iconSize = 20.0,
    @required this.index,
    @required this.controller,
    this.selectedIndex,
  }) : super(key: key);

  bool get bActive => selectedIndex == index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkResponse(
        onTap: () {
          controller.jumpToPage(index);
        },
        splashFactory: InkRipple.splashFactory,
        radius: 30.0,
        containedInkWell: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              size: iconSize,
              color: bActive ? ThemeColor.primary : Colors.grey[500],
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 10.0,
                  color: bActive ? ThemeColor.primary : Colors.grey[500],
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
