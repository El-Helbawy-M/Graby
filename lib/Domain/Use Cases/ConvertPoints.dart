import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';

class PointsHandler {
  User user;
  BuildContext context;
  UserCollectionHandler _userHandler;
  PointsHandler(this.user, this.context) {
    _userHandler = UserCollectionHandler(this.user.phone);
  }
  Future<bool> convertPoints() async {
    bool check = (user.points < 5) ? false : null;
    while (check == null)
      check = await _userHandler.updateUser(
        {
          'Points': user.points % 5,
          'Balance': user.balance + (user.points ~/ 5)
        },
      );
    return check;
  }

  Future<User> refreshUserData() async {
    Map<String, dynamic> data;
    User user;
    while (data == null) data = await this._userHandler.getUserData();
    if (data.isNotEmpty) {
      user = User(data['Name'], data['Phone'], data['Balance'], data['Points']);
    }
    return user;
  }

  Future<void> convert() async {
    bool check;
    showDialog(
      context: this.context,
      builder: (context) => loadinDialog,
    );
    while (check == null) check = await this.convertPoints();
    Navigator.pop(context);
    if (check) {
      showDialog(
        context: this.context,
        builder: (context) => done,
      );
      Timer(
        Duration(seconds: 1),
        () => Navigator.pop(this.context),
      );
    }
  }
}
