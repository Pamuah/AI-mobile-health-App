import 'package:flutter/foundation.dart';

import '../models/user.dart';

class UserData extends ChangeNotifier {
  User currentUser =
      User(email: "none", id: 00000000, name: "none", password: "Password@123");

  void getUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  String get userName => currentUser.name;
  int get userId => currentUser.id;
  String get userEmail => currentUser.email;
  String get userPassword => currentUser.password;
}
