import 'package:animated_text_kit/animated_text_kit.dart';
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
              ? SizedBox(
                  width: 200.0,
                  child: TypewriterAnimatedTextKit(
                      totalRepeatCount: 1,
                      speed: Duration(milliseconds: 150),
                      text: [title],
                      textStyle:
                          TextStyle(fontSize: 16.0, color: Colors.black54),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                )
              : Container(),
        ],
      ),
    );
  }
}
