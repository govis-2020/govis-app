import 'package:govis/helper.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColor.primary,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
