import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:govis/helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:govis/page/auth_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      var account = await _googleSignIn.signIn();
      var auth = await account.authentication;

      var res = await dio.postUri(
        getUri('/user/login'),
        data: {
          "googleIdToken": auth.accessToken,
        },
      );

      log.i(res.data);

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1500),
          pageBuilder: (_, __, ___) => AuthPage(),
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColor.primary,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FadeIn(
                    duration: 2.seconds,
                    curve: Curves.easeOut,
                    child: Hero(
                      tag: 'hero-logo',
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("GOVIS").textColor(Colors.white).bold().fontSize(36),
                  SizedBox(height: 100),
                  BaseButton(
                    onPressed: () async {
                      await _handleSignIn();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("구글 계정으로 로그인"),
                        SizedBox(width: 15),
                        Image.asset(
                          "assets/images/google_logo.png",
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
