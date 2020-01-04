import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board.g.dart';

@JsonSerializable()
class Board extends Equatable {
  int id;
  int boardId;
  String title;
  String content;
  List<Map<String, String>> attachment;
  DateTime crawlCreatedAt;
  DateTime createdAt;

  Board({
    this.id,
    this.boardId,
    this.title,
    this.content,
    this.attachment,
    this.crawlCreatedAt,
    this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        boardId,
        title,
        content,
        attachment,
        crawlCreatedAt,
        createdAt,
      ];

  factory Board.fromJson(Map<String, dynamic> json) {
    return _$BoardFromJson(json);
  }
}

// String _parseSubjectName(Map<String, dynamic> timetableSubject) {
//   var reviewSubject =
//       timetableSubject != null ? timetableSubject["reviewSubject"] : null;

//   return reviewSubject == null ? null : reviewSubject["name"];
// }

// List<Map<String, String>> _parseAttachkment(String attachment) {
//   return attachment != null
//       ? (JSON.json.decode(attachment)).cast<Map<String, String>>()
//       : null;
// }