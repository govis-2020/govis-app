import 'package:flutter/material.dart';
import 'package:govis/board/board_list_card.dart';
import 'package:govis/helper.dart';
import 'package:govis/home/home_news_card.dart';
import 'package:govis/model/board.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fetchRecentBoards() async {
    var res = await dio.getUri(getUri("/boards", {"limit": "5"}));

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

  fetchMyKeywordBoards() async {
    var res =
        await dio.getUri(getUri("/boards", {"limit": "5", "interest": "Y"}));

    log.i(res.data);

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
            GovisAppbar(
              title: "홍길동님, 좋은 아침이에요!",
              isAnimated: true,
            ),
            SizedBox(height: 20),
            HomeNewsCard(),
            SizedBox(height: 20),
            FutureBuilder(
              future: fetchRecentBoards(),
              builder: (BuildContext context, snapshot) {
                bool hasData = snapshot.hasData && snapshot.data.length > 0;

                return BoardListCard(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("최근 소식").bold().fontSize(16),
                      Text("NEW").fontSize(8).textColor(Colors.red),
                    ],
                  ),
                  boards: hasData ? snapshot.data : [],
                );
              },
            ),
            SizedBox(height: 30),
            FutureBuilder(
              future: fetchMyKeywordBoards(),
              builder: (BuildContext context, snapshot) {
                bool hasData = snapshot.hasData && snapshot.data.length > 0;

                return BoardListCard(
                  title: Text("내 관심사 소식").bold().fontSize(16),
                  boards: hasData ? snapshot.data : [],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
