import 'package:flutter/material.dart';
import 'package:govis/board/board_list_card.dart';
import 'package:govis/helper.dart';
import 'package:govis/home/home_news_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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