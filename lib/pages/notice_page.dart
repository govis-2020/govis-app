import 'package:govis/board/board_list_card.dart';
import 'package:govis/helper.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return BaseNoneGlowScrollWrapper(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            GovisAppbar(title: "고려대학교 공지사항"),
            SizedBox(height: 20),
            SizedBox(height: 20),
            BoardListCard(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("최근 소식").bold().fontSize(16),
                  Text("NEW").fontSize(8).textColor(Colors.red),
                ],
              ),
            ),
            SizedBox(height: 30),
            BoardListCard(
              title: Text("내 관심사 소식").bold().fontSize(16),
            ),
          ],
        ),
      ),
    );
  }
}
