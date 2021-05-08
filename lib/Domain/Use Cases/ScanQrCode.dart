import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Screens/UserScreens/PaymentScreen.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';

import 'PayFare.dart';

class Scanner {
  User value;
  BuildContext context;
  Scanner(this.context, this.value);
  Future<void> scan() async {
    PayHandler handler = PayHandler(this.value);
    bool check;
    while (check == null) check = await handler.scaneQrCode();
    if (check) {
      showDialog(
        context: this.context,
        builder: (context) => loadinDialog,
      );
      check = null;
      while (check == null) check = await handler.runOperation();
      Navigator.pop(this.context);
      if (check) {
        Navigator.push(
          this.context,
          MaterialPageRoute(
            builder: (context) => PaymentScreen(
              handler: handler,
              user: this.value,
            ),
          ),
        );
      }
    }
  }
}
