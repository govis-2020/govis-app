// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
    id: json['id'] as int,
    boardId: json['boardId'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    attachment: (json['attachment'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
    crawlCreatedAt: json['crawlCreatedAt'] == null
        ? null
        : DateTime.parse(json['crawlCreatedAt'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'id': instance.id,
      'boardId': instance.boardId,
      'title': instance.title,
      'content': instance.content,
      'attachment': instance.attachment,
      'crawlCreatedAt': instance.crawlCreatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
