import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:graby/Domain/Repo/DriverSide.dart';
import 'package:permission_handler/permission_handler.dart';

class PayHandler {
  //============================================== Variables
  User _passanger;
  DriverSide _driver;
  DriverCollectionHandler _driverHandler;
  UserCollectionHandler _userHandler;
  //============================================== End
  PayHandler(this._passanger) {
    this._userHandler = UserCollectionHandler(this._passanger.phone);
  }

  //============================================== Getters
  DriverSide get driver => this._driver;
  //============================================== End

  //============================================== Functions
  Future<bool> scaneQrCode() async {
    String driverName;
    try {
      if (await Permission.camera.request().isGranted)
        driverName = await scanner.scan();
    } catch (e) {}
    if (driverName != null) {
      this._driverHandler = DriverCollectionHandler(
        driverName,
      );
      return true;
    } else
      return false;
  }

  Future<bool> runOperation() async {
    Map<String, dynamic> holder;
    bool check = false;
    while (holder == null) holder = await this._driverHandler.getDriverData();
    print(holder);
    if (holder.isNotEmpty) {
      check = true;
      this._driver = DriverSide(
        holder['Name'],
        holder['Phone'],
        holder['Price'],
        holder['Image'],
        holder['Balance'],
      );
    }
    return check;
  }

  Future<bool> pay() async {
    bool check1, check2;
    while (check2 == null || check1 == null) {
      check1 = await this._userHandler.updateUser(
          {'Balance': this._passanger.balance - this._driver.price});
      check2 = await this
          ._driverHandler
          .updateDriver({'Balance': this._driver.balance + this._driver.price});
    }
    return check2 && check1;
  }

  Future<User> refreshUserData() async {
    Map<String, dynamic> data;
    User user;
    while (data == null) data = await this._userHandler.getUserData();
    if (data.isNotEmpty) {
      user = User(data['Name'], data['Phone'], data['Balance']);
    }
    return user;
  }
  //============================================== End
}
