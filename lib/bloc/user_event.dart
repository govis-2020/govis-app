import 'package:equatable/equatable.dart';
import 'package:govis/helper.dart';
import 'package:govis/model/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLogin extends UserEvent {
  final User user;

  UserLogin({@required this.user});

  @override
  String toString() => "UserLogin";

  @override
  List<Object> get props => [];
}
