import 'package:google_sign_in/google_sign_in.dart';
import 'package:govis/helper.dart';
import 'package:govis/pages/login_page.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      "openid",
      "profile",
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                color: ThemeColor.primary,
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("내 정보").textColor(Colors.white).bold().fontSize(20),
              )
            ],
          ),
          ListTile(
            onTap: () async {},
            title: Text("내 관심사 키워드"),
          ),
          BaseDivider(),
          ListTile(
            onTap: () async {
              await _googleSignIn.disconnect();
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1500),
                  pageBuilder: (_, __, ___) => LoginPage(),
                ),
              );
            },
            title: Text("로그아웃"),
          ),
          BaseDivider(),
        ],
      ),
    );
  }
}
