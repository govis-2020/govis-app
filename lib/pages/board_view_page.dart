import 'package:flutter_html/flutter_html.dart';
import 'package:govis/helper.dart';
import 'package:govis/model/board.dart';

class BoardViewPage extends StatelessWidget {
  final int id;

  BoardViewPage({@required this.id});

  Future<Board> fetchBoard() async {
    try {
      var res = await dio.getUri(getUri("/board/$id"));

      return Board.fromJson(res.data["crawlData"]);
    } catch (e) {
      log.e(e);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: fetchBoard(),
              builder: (context, snapshot) {
                if (snapshot.hasError || !snapshot.hasData) return Container();
                Board board = snapshot.data;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GovisAppbar(title: board.title),
                    SizedBox(height: 10),
                    Expanded(
                      child: BaseNoneGlowScrollWrapper(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${board.createdAt.toString().substring(0, 10)} 작성됨.")
                                  .fontSize(12)
                                  .textColor(Colors.black54),
                              SizedBox(height: 20),
                              Html(
                                data: board.content,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
