import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import "package:govis/App.dart";

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserUninitialized();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserLogin) {
      yield* _mapUserLogin(event);
    }
    //
    // TODO: Add Logic
  }
}

Stream<UserState> _mapUserLogin(UserLogin event) async* {
  //유저 정보를 저장한다.
  dependencies.userRepository.setUser(event.user);

  yield UserLoaded();
}
