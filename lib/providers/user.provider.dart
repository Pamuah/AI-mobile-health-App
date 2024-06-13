import 'package:flutter/foundation.dart';

import '../models/user.dart';

class UserData extends ChangeNotifier {
  User currentUser =
      User(email: "none", id: 00000000, name: "none", password: "Password@123");

  void getUser(User user) {
    currentUser = user;
    notifyListeners();
  }

  String get username => currentUser.name;
  int get userid => currentUser.id;
  String get useremail => currentUser.email;
}
