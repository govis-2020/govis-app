import 'package:flutter/material.dart';
import 'package:govis/layouts/default.dart';
import 'package:govis/page/login_page.dart';
import 'package:govis/styles/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '고비스',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: ThemeColor.primary,
        primaryColorDark: ThemeColor.primaryDark,
        primaryColorLight: ThemeColor.primaryLight,
        secondaryHeaderColor: ThemeColor.secondary,
      ),
      // home: LoginPage(),
      home: DefaultLayout(),
    );
  }
}
