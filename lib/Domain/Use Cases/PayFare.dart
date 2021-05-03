import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Repo/Bill.dart';
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
      this._driver = Driver(
        holder['Name'],
        holder['Phone'],
        holder['Balance'],
        holder['Image'],
        holder['Price'],
      );
    }
    return check;
  }

  Future<bool> pay() async {
    bool check1, check2;
    print(this._passanger.points);
    while (check2 == null || check1 == null) {
      check1 = await this._userHandler.updateUser(
        {
          'Balance': this._passanger.balance - this._driver.price,
          'Points': this._passanger.points + 1
        },
      );
      check2 = await this._driverHandler.updateDriver(
        {'Balance': this._driver.balance + this._driver.price},
      );
    }
    if (check2 && check1) {
      Bill newBill = new Bill(
        'المنصوره',
        'دمياط',
        'ط د ر 1234',
        this._passanger.phone,
        driver: driver,
      );
      await newBill.addBill();
    }
    return check2 && check1;
  }
  //============================================== End
}
