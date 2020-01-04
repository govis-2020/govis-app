import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int userId;
  final String userName;
  final String email;
  final bool isValid;

  User({
    this.userId,
    this.userName,
    this.email,
    this.isValid,
  });

  @override
  List<Object> get props => [
        userId,
        userName,
        email,
        isValid,
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  User copyWith({int userId, String userName, String email, bool isValid}) {
    return User(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
    );
  }
}
