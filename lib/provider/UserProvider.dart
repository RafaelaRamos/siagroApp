import 'dart:math';
import 'package:flutter/material.dart';
import 'package:siagro/data/dummy_users.dart';
import 'package:siagro/models/User.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _users = {...DUMMY_USERS};

  List<User> get all {
    return [..._users.values];
  }

  int get count {
    return _users.length;
  }

  User byIndex(int i) {
    return _users.values.elementAt(i);
  }

  void remove(User user) {
    print(user.id);
    if (user != null && user.id != null) {
      _users.remove(user.id);
      notifyListeners();
    }
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _users.containsKey(user.id)) {
      _users.update(
          user.id,
          (_) => User(
              id: user.id,
              name: user.name,
              email: user.email,
              senha: user.senha));
    } else {
      final id = Random().nextDouble().toString();

      _users.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          senha: user.senha,
        ),
      );
    }
    notifyListeners();
  }
}
