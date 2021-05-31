import 'package:graby/Data/Handlers/DriverBillCollectionHandler.dart';
import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Repo/UserBill.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class PayHandler {
  //============================================== Variables
  User _passanger;
  Driver _driver;
  DriverCollectionHandler _driverHandler;
  UserCollectionHandler _userHandler;
  //============================================== End
  PayHandler(this._passanger) {
    this._userHandler = UserCollectionHandler(this._passanger.phone);
  }

  //============================================== Getters
  Driver get driver => this._driver;
  //============================================== End

  //============================================== Functions
  Future<bool> scaneQrCode() async {
    String driverName;
    try {
      if (await Permission.camera.request().isGranted) driverName = await scanner.scan();
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
      this._driver = Driver(
        holder['Name'],
        holder['Phone'],
        holder['Balance'],
        holder['Image'],
        holder['Price'],
        holder['Car Number'],
        holder['Start Point'],
        holder['End Point'],
      );
    }
    return check;
  }

  Future<bool> pay() async {
    bool check1, check2;
    print(this._passanger.points);
    while (check2 == null || check1 == null) {
      check1 = await this._userHandler.updateUser(
        {'Balance': this._passanger.balance - this._driver.price, 'Points': this._passanger.points + 1},
      );
      check2 = await this._driverHandler.updateDriver(
        {'Balance': this._driver.balance + this._driver.price},
      );
    }
    if (check2 && check1) {
      UserBill newBill = new UserBill(
        driver.startPoint,
        driver.endPoint,
        '${driver.carNumber}',
        this._passanger.phone,
        driver: driver,
      );
      await DirverBillCollectionHandler(this.driver.phone).addUser({this._passanger.name: this._passanger.phone});
      await newBill.addBill();
    }
    return check2 && check1;
  }
  //============================================== End
}
