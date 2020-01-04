import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserUninitialized extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  @override
  List<Object> get props => [];
}
