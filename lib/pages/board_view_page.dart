import 'package:govis/helper.dart';

class BoardViewPage extends StatelessWidget {
  final int id;

  BoardViewPage({@required this.id});

  fetchBoard() async {
    try {
      var res = await dio.getUri(getUri("/board/$id"));
      log.i(res.data);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
              future: fetchBoard(),
              builder: (context, snapshot) {
                return Column(
                  children: <Widget>[
                    GovisAppbar(),
                    Text(id.toString()),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
