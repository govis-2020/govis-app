import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:govis/helper.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isShow = false;

  @override
  void initState() {
    super.initState();

    showImage();
  }

  showImage() async {
    await Future.delayed(1.5.seconds);
    setState(() {
      isShow = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: ThemeColor.primary,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: <Widget>[
                _buildAppbar(),
                SizedBox(height: 30),
                isShow ? _buildContent() : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return FadeIn(
      duration: Duration(seconds: 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("고려인을 인증해주세요").bold().textColor(Colors.white).fontSize(24),
            SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                hintText: "학번",
                hoverColor: Colors.white,
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "비밀번호",
                hoverColor: Colors.white,
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 50),
            Center(
              child: BaseButton(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                onPressed: () {},
                child: Text("인증하기"),
                type: BaseButtonType.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Hero(
            tag: 'hero-logo',
            child: Image.asset(
              "assets/images/logo.png",
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
