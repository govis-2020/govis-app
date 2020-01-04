import 'package:flutter/material.dart';

enum BaseInkType { widget, image }

class BaseInk extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  final EdgeInsets padding;
  final Color color;
  final double borderRadius;

  final Duration delay;

  final Color splashColor;
  final Color highlightColor;

  final BaseInkType type;

  BaseInk({
    @required this.child,
    @required this.onTap,
    Key key,
    this.color = Colors.transparent,
    this.delay = const Duration(milliseconds: 0),
    this.splashColor,
    this.highlightColor,
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = 0.0,
  })  : type = BaseInkType.widget,
        super(key: key);

  BaseInk.image({
    @required this.child,
    @required this.onTap,
    this.delay = const Duration(milliseconds: 0),
    this.splashColor,
    this.highlightColor,
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius = 0.0,
  })  : type = BaseInkType.image,
        color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    if (type == BaseInkType.image) {
      return Stack(
        children: <Widget>[
          Padding(
            padding: padding,
            child: child,
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: highlightColor,
                  splashColor: splashColor,
                  onTap: _onTap,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: color,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: highlightColor,
            splashColor: splashColor,
            onTap: _onTap,
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() async {
    await Future.delayed(delay);

    this.onTap();
  }
}
