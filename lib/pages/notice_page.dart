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
            GovisAppbar(title: "공지사항"),
            SizedBox(height: 20),
            SizedBox(height: 20),
            BoardListCard(
              title: _buildTitleText("고려대학교 도서관"),
            ),
            SizedBox(height: 30),
            BoardListCard(
              title: _buildTitleText("고려대학교 경력개발센터"),
            ),
            SizedBox(height: 30),
            BoardListCard(
              title: _buildTitleText("고려대학교 컴퓨터학과 게시판"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(text).bold().fontSize(16);
  }
}
