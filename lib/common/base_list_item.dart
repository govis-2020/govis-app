import 'package:govis/helper.dart';

class BaseListItem extends StatelessWidget {
  // final String title;
  // final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseInk(
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "경력개발센터 공지사항 근로장학생 모집중입니다.",
                    overflow: TextOverflow.ellipsis,
                  ).textColor(Colors.black87),
                ),
                Text("2019.12.31").fontSize(10).textColor(Colors.black38),
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
