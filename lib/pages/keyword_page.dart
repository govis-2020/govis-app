import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:govis/helper.dart';
import 'package:govis/layouts/default.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPageState createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  List<String> selectedKeywords = [];
  List<Map<String, dynamic>> keywords = [];

  LoadingWrapperController loadingController = LoadingWrapperController();
  @override
  void initState() {
    super.initState();

    fetchKeywords();
  }

  fetchKeywords() async {
    try {
      var res = await dio.getUri(getUri("/keywords"));
      setState(() {
        keywords = res.data["keywordEntities"].cast<Map<String, dynamic>>();
      });
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWrapper(
      controller: loadingController,
      builder: (context, loading) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        onPressed: _onSubmit,
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
      },
    );
  }

  void _onSubmit() {
    loadingController.loadFuture(() async {
      // dio.postUri(
      //   getUri('/user/keywords'),
      //   data: {"userKeywords": []},
      // );

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DefaultLayout()));
    });
  }

  void _onTapKeywordButton(String text) {
    if (_isIncludeKeyword(text)) {
      setState(() {
        selectedKeywords.remove(text);
      });
    } else {
      setState(() {
        selectedKeywords.add(text);
      });
    }
  }

  bool _isIncludeKeyword(String text) {
    return selectedKeywords.contains(text);
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Text("관심있는 키워드를 선택하세요").bold().textColor(Colors.white).fontSize(24),
          SizedBox(height: 150),
          keywords.length > 0
              ? FadeIn(
                  duration: Duration(milliseconds: 1500),
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < keywords.length; i++) ...[
                        _KeywordButton(
                          text: keywords[i]["name"],
                          active: _isIncludeKeyword(keywords[i]["name"]),
                          onTap: _onTapKeywordButton,
                        ),
                        SizedBox(height: 20),
                      ],
                      Text("${selectedKeywords.length}개 선택")
                          .textColor(Colors.white70)
                          .fontSize(12),
                    ],
                  ),
                )
              : Container(),
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
