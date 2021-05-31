import 'dart:async';

import 'package:graby/Data/Handlers/DriverBillCollectionHandler.dart';

class DriverTripController {
  int seconds = 0, minutes = 0, users = 0;
  Timer timer, notifyTimer;
  bool running = false, notifaction = false;
  DriverTripController();
  void start() {
    running = true;
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (seconds == 59) {
          seconds = 0;
          minutes++;
        } else {
          seconds++;
        }
      },
    );
  }

  bool checkTime() => minutes == 10;
  void end(String phone) {
    running = false;
    timer.cancel();
    clear(phone);
  }

  void showNotifaction() {
    this.users++;
    if (!notifaction) {
      notifaction = true;
      notifyTimer = Timer(
        Duration(seconds: 10),
        () {
          notifyTimer.cancel();
          notifaction = false;
        },
      );
    } else {
      notifyTimer.cancel();
      notifyTimer = Timer(
        Duration(seconds: 10),
        () {
          notifyTimer.cancel();
          notifaction = false;
        },
      );
    }
  }

  Future<void> clear(String phone) async {
    await DirverBillCollectionHandler(phone).clearUsers();
    seconds = minutes = users = 0;
  }
}
