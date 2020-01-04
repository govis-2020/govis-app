import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:govis/helper.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  bool isShow = false;

  @override
  void initState() {
    super.initState();

    showImage();
  }

  showImage() async {
    await Future.delayed(1.seconds);
    setState(() {
      isShow = true;
    });
  }

  Future<void> _handleSignIn() async {
    try {
      var account = await _googleSignIn.signIn();
      var auth = await account.authentication;
      print(auth.accessToken);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ThemeColor.primary,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FadeIn(
                duration: 2.seconds,
                curve: Curves.easeOut,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 30),
              Text("GOVIS").textColor(Colors.white).bold().fontSize(36),
              SizedBox(height: 100),
              RaisedButton(
                onPressed: () async {
                  await _handleSignIn();
                },
                child: Text("로그인"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
