import 'package:govis/helper.dart';
import 'package:govis/model/board.dart';
import 'package:govis/pages/board_view_page.dart';

class BaseListItem extends StatelessWidget {
  final Board board;

  BaseListItem({@required this.board});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseInk(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) => BoardViewPage(id: board.id),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    board.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ).textColor(Colors.black87).fontSize(10),
                ),
                Text("2019.12.31").fontSize(9).textColor(Colors.black38),
              ],
            ),
            SizedBox(height: 10),
            BaseDivider(padding: 0),
          ],
        ),
      ),
    );
  }
}
