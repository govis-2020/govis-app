import 'package:govis/helper.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  List<String> keywords = [];

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
              children: <Widget>[
                GovisAppbar(),
                SizedBox(height: 30),
                Expanded(child: _buildContent()),
                Center(
                  child: BaseButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    onPressed: () {},
                    child: Text("완료").fontSize(18),
                    // type: BaseButtonType.white,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapKeywordButton(String text) {
    if (_isIncludeKeyword(text)) {
      setState(() {
        keywords.remove(text);
      });
    } else {
      setState(() {
        keywords.add(text);
      });
    }
  }

  bool _isIncludeKeyword(String text) {
    return keywords.contains(text);
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Text("관심있는 키워드를 선택하세요").bold().textColor(Colors.white).fontSize(24),
          SizedBox(height: 150),
          _KeywordButton(
            text: "장학금",
            active: _isIncludeKeyword("장학금"),
            onTap: _onTapKeywordButton,
          ),
          SizedBox(height: 20),
          _KeywordButton(
            text: "이중/복수전공",
            active: _isIncludeKeyword("이중/복수전공"),
            onTap: _onTapKeywordButton,
          ),
          SizedBox(height: 20),
          _KeywordButton(
            text: "교환학생",
            active: _isIncludeKeyword("교환학생"),
            onTap: _onTapKeywordButton,
          ),
          SizedBox(height: 20),
          _KeywordButton(
            text: "취업",
            active: _isIncludeKeyword("취업"),
            onTap: _onTapKeywordButton,
          ),
          SizedBox(height: 30),
          Text("${keywords.length}개 선택").textColor(Colors.white70).fontSize(12),
        ],
      ),
    );
  }
}

class _KeywordButton extends StatelessWidget {
  final String text;
  final bool active;
  final ValueChanged<String> onTap;

  _KeywordButton(
      {@required this.text, @required this.active, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
      onPressed: () {
        onTap(text);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(color: Colors.white),
      ),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      color: active ? Colors.white : Colors.transparent,
      child: Text(text)
          .textColor(active ? ThemeColor.primary : Colors.white)
          .fontSize(18),
    );
  }
}
