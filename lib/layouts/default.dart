import 'package:flutter/material.dart';
import 'package:govis/layouts/tab_button.dart';
import 'package:govis/page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:govis/helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DefaultLayout extends StatefulWidget {
  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  final List<Widget> _children = [
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  LoadingWrapperController loadingController = LoadingWrapperController();
  PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomTabHeight = 70.0 + MediaQuery.of(context).padding.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoadingWrapper(
        controller: loadingController,
        builder: (context, loading) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                _buildPageView(bottomTabHeight),
                _buildBottomTabs(bottomTabHeight),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageView(double bottomTabHeight) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (idx) {
        setState(() {
          _currentIndex = idx;
        });
      },
      controller: pageController,
      itemCount: 5,
      itemBuilder: (context, idx) {
        return Container(
          margin: EdgeInsets.only(bottom: bottomTabHeight),
          child: _children[idx],
        );
        return MultiProvider(
          providers: [
            Provider<PageController>.value(value: pageController),
            Provider<LoadingWrapperController>.value(value: loadingController),
          ],
          child: Container(
            margin: EdgeInsets.only(bottom: bottomTabHeight),
            child: _children[idx],
          ),
        );
      },
    );
  }

  Widget _buildBottomTabs(double bottomTabHeight) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      height: bottomTabHeight,
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5.0, color: Colors.black12)],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TabButton(
                icon: Icons.home,
                text: "홈",
                index: 0,
                controller: pageController,
                selectedIndex: _currentIndex,
              ),
            ),
            Expanded(
              child: TabButton(
                icon: FontAwesomeIcons.fileAlt,
                text: "공지사항",
                iconSize: 16.0,
                index: 1,
                controller: pageController,
                selectedIndex: _currentIndex,
              ),
            ),
            Expanded(
              child: TabButton(
                icon: Icons.public,
                text: "지도",
                iconSize: 18.0,
                index: 2,
                controller: pageController,
                selectedIndex: _currentIndex,
              ),
            ),
            Expanded(
              child: TabButton(
                icon: FontAwesomeIcons.solidUserCircle,
                text: "내정보",
                iconSize: 16.0,
                index: 3,
                controller: pageController,
                selectedIndex: _currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
