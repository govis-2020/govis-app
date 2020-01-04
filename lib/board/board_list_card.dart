import 'package:govis/base/base_list_item.dart';
import 'package:govis/helper.dart';
import 'package:govis/model/board.dart';

class BoardListCard extends StatelessWidget {
  final Widget title;
  final VoidCallback onClickMoreButton;
  final List<Board> boards;

  BoardListCard({
    @required this.title,
    this.onClickMoreButton,
    this.boards = const [],
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              title,
              BaseInk(
                padding: EdgeInsets.all(10),
                onTap: onClickMoreButton ?? () {},
                child: Text('더보기').fontSize(12).textColor(Colors.black54),
              )
            ],
          ),
          SizedBox(height: 20),
          for (int i = 0; i < boards.length; i++) BaseListItem()
        ],
      ),
    );
  }
}
