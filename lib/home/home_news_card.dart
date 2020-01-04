import 'package:govis/helper.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

final List<String> _images = [
  "assets/images/1.jpg",
  "assets/images/2.jpg",
  "assets/images/3.jpg",
  "assets/images/4.jpg",
];
final List<String> _titles = [
  "2019 QS 아시아대학 평가 종합사립대 1위",
  "‘2019 그랜드 오픈메이커데이’ 성료",
  "세종캠퍼스, 산학협력관 준공식 열려",
  "참여형 스마트캠퍼스에서 펼쳐지는 교육의 혁신, SK미래관 준공",
];
final List<String> _descriptions = [
  "도쿄대 앞지르며 아시아에서 12위, 4년 연속 종합 사립대 1위 '국제연구협력' 지표에서 우수한 성적으로 국내 1위 차지",
  "‘X-GARAGE’ 3관왕으로 메이커스페이스 성과 인정 받아",
  "12월 20일, 고려대학교 세종캠퍼스 산학협력관 준공식이 열렸다. 고려대학교 세종캠퍼스는 교육 시설 확충 계획에 따라 '정문, 산학협력관, 문화스포츠관' 신축사업을 진행해왔다. 산학협력관은 연구역량 증진과 기술발전 도보를 위해 추진되어 지난 2018년 5월 착공하여 1년 7개월의 공정 끝에 12월 완공됐다.",
  "‘지식 창출 공간’으로 대학건물에 대한 고정관념 깨다",
];

class HomeNewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text("고대 뉴스").bold().fontSize(16),
        ),
        Container(
          height: 250,
          child: TransformerPageView(
            loop: true,
            viewportFraction: 0.8,
            transformer: PageTransformerBuilder(
              builder: (Widget child, TransformInfo info) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Material(
                    elevation: 4.0,
                    textStyle: TextStyle(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        ParallaxImage.asset(
                          _images[info.index],
                          position: info.position,
                        ),
                        Image.asset(_images[info.index]),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.bottomCenter,
                              end: FractionalOffset.topCenter,
                              colors: [
                                Color(0xaa000000),
                                Color(0x00FFFFFF),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ParallaxContainer(
                                child: Text(
                                  _titles[info.index],
                                  style: TextStyle(fontSize: 12.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                position: info.position,
                                translationFactor: 300.0,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              ParallaxContainer(
                                child: Text(
                                  _descriptions[info.index],
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.white70),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                position: info.position,
                                translationFactor: 200.0,
                              ),
                            ],
                          ),
                          left: 10,
                          right: 10,
                          bottom: 10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            itemCount: _images.length,
          ),
        ),
      ],
    );
  }
}
