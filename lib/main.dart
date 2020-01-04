import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:govis/layouts/default.dart';
import 'package:govis/pages/login_page.dart';
import 'package:govis/styles/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<UserBloc>(builder: (context) => UserBloc()),
        // BlocProvider<YscecBoardBloc>(builder: (context) => YscecBoardBloc()),
        // BlocProvider<BoardBloc>(builder: (context) => BoardBloc()),
        // BlocProvider<NotiBloc>(builder: (context) => NotiBloc()),
        // BlocProvider<ExamReviewBloc>(builder: (context) => ExamReviewBloc()),
      ],
      child: MaterialApp(
        title: '고비스',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: ThemeColor.primary,
          primaryColorDark: ThemeColor.primaryDark,
          primaryColorLight: ThemeColor.primaryLight,
          secondaryHeaderColor: ThemeColor.secondary,
        ),
        home: LoginPage(),
        // home: DefaultLayout(),
      ),
    );
  }
}
