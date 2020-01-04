import 'package:govis/helper.dart';

class BaseDivider extends StatelessWidget {
  final Color color;
  final double padding;

  BaseDivider({
    this.color = const Color(0xFFE0E0E0),
    this.padding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      color: color,
      height: 1,
      width: double.infinity,
    );
  }
}
