import 'package:govis/helper.dart';

class GovisAppbar extends StatelessWidget {
  final String title;

  GovisAppbar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Hero(
            tag: 'hero-logo',
            child: Image.asset(
              "assets/images/logo.png",
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: 20),
          title != null
              ? Text(title).fontSize(16).textColor(Colors.black).opacity(0.7)
              : Container(),
        ],
      ),
    );
  }
}
