import 'package:govis/model/user.dart';

class UserRepository {
  User _user;

  void setUser(User user) {
    _user = user;
  }

  User getUser() {
    return _user;
  }
}
