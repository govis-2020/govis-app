import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:govis/Dependencies.dart';
import 'package:govis/bloc/bloc.dart';
import 'package:govis/helper.dart';
import 'package:govis/layouts/default.dart';
import 'package:govis/pages/login_page.dart';

Dependencies _sharedDependencies;
Dependencies get dependencies => _sharedDependencies;

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
    Dependencies dependencies,
  }) : super(key: key) {
    _sharedDependencies = dependencies;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
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
