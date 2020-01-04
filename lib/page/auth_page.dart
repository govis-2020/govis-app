import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:govis/helper.dart';
import 'package:govis/page/keyword_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isShow = false;
  TextEditingController idController;
  TextEditingController passwordController;

  FocusNode idFocusNode;
  FocusNode passwordFocusNode;

  LoadingWrapperController loadingController = LoadingWrapperController();

  @override
  void initState() {
    super.initState();

    idController = TextEditingController();
    passwordController = TextEditingController();

    idFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    showImage();
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();

    idFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  showImage() async {
    await Future.delayed(1.5.seconds);
    setState(() {
      isShow = true;
    });
  }

  validHakbun() {
    loadingController.loadFuture(() async {
      var res = await dio.postUri(getAuthUri('/'),
          data: {"id": idController.text, "password": passwordController.text});

      if (res.data) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => KeywordPage(),
          ),
        );
      } else {
        showError("학번 또는 비밀번호가 유효하지 않습니다.", context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingWrapper(
        controller: loadingController,
        builder: (loading, context) {
          return Container(
            color: ThemeColor.primary,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    GovisAppbar(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30),
                            isShow ? _buildContent() : SizedBox(),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              focusNode: idFocusNode,
              controller: idController,
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
              controller: passwordController,
              focusNode: passwordFocusNode,
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
                onPressed: () {
                  validHakbun();
                },
                child: Text("인증하기"),
                type: BaseButtonType.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
