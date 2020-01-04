import 'package:flutter/material.dart';
import 'package:govis/base/base_list_item.dart';
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
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              GovisAppbar(title: "홍길동님, 좋은 아침이에요!"),
              SizedBox(height: 20),
              HomeNewsCard(),
              SizedBox(height: 20),
              BaseCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("최근 소식").bold().fontSize(16),
                            Text("NEW").fontSize(8).textColor(Colors.red),
                          ],
                        ),
                        BaseInk(
                          padding: EdgeInsets.all(10),
                          onTap: () {},
                          child: Text('더보기')
                              .fontSize(12)
                              .textColor(Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    BaseListItem(),
                    BaseListItem(),
                    BaseListItem(),
                    BaseListItem(),
                    BaseListItem(),
                  ],
                ),
              ),
              SizedBox(height: 30),
              BaseCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("내 관심사 소식").bold().fontSize(16),
                          ],
                        ),
                        BaseInk(
                          padding: EdgeInsets.all(10),
                          onTap: () {},
                          child: Text('더보기')
                              .fontSize(12)
                              .textColor(Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    BaseListItem(),
                    BaseListItem(),
                    BaseListItem(),
                    BaseListItem(),
                    BaseListItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
