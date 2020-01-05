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
            MaterialPageRoute(
                builder: (context) => BoardViewPage(id: board.id)),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                board.keyword != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(board.keyword)
                            .fontSize(8)
                            .textColor(Colors.black54),
                      )
                    : Container(),
                Expanded(
                  child: Text(
                    board.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ).textColor(Colors.black87).fontSize(10),
                ),
                Text(board.createdAt.toString().substring(0, 10))
                    .fontSize(9)
                    .textColor(Colors.black38),
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
