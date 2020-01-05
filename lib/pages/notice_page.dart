import 'package:govis/board/board_list_card.dart';
import 'package:govis/helper.dart';
import 'package:govis/model/board.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  fetchBoards(String type) async {
    var res = await dio.getUri(getUri("/boards", {"limit": "5", "type": type}));

    if (res.data["code"] == 200) {
      var boards = res.data["infos"]
          .map((b) {
            return Board.fromJson(b);
          })
          .toList()
          .cast<Board>();

      return boards;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return BaseNoneGlowScrollWrapper(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: <Widget>[
            GovisAppbar(title: "공지사항"),
            SizedBox(height: 20),
            FutureBuilder(
              future: fetchBoards("cs"),
              builder: (BuildContext context, snapshot) {
                bool hasData = snapshot.hasData && snapshot.data.length > 0;

                return BoardListCard(
                  title: Text("고려대학교 컴퓨터학과 게시판").bold().fontSize(16),
                  boards: hasData ? snapshot.data : [],
                );
              },
            ),
            SizedBox(height: 30),
            FutureBuilder(
              future: fetchBoards("job"),
              builder: (BuildContext context, snapshot) {
                bool hasData = snapshot.hasData && snapshot.data.length > 0;

                return BoardListCard(
                  title: Text("고려대학교 경력개발센터").bold().fontSize(16),
                  boards: hasData ? snapshot.data : [],
                );
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(text).bold().fontSize(16);
  }
}
