import 'package:flutter/material.dart';
import 'package:govis/helper.dart';

enum BaseButtonType {
  primary,
  white,
}

class BaseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final BaseButtonType type;
  final bool plain;
  final Widget child;
  final EdgeInsets padding;

  BaseButton({
    this.onPressed,
    this.type = BaseButtonType.primary,
    this.plain = false,
    this.child,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    Color color =
        type == BaseButtonType.primary ? ThemeColor.primary : Colors.white;
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(color: color, width: 1.5),
      ),
      elevation: 0.0,
      color: plain ? Colors.white : color,
      textColor: plain
          ? color
          : type == BaseButtonType.primary ? Colors.white : ThemeColor.primary,
      splashColor: plain ? color.withOpacity(0.2) : Colors.white12,
      highlightColor: color.withOpacity(0.1),
      onPressed: onPressed,
      child: Padding(padding: padding, child: child),
    );
  }
}
