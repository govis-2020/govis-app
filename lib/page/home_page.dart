import 'package:flutter/material.dart';
import 'package:govis/helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GovisAppbar(title: "홍길동님, 좋은 아침이에요!",),
        ],
      ),
    );
  }
}
