import 'package:graby/Data/Handlers/UserBillCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Domain/Repo/DriverLite.dart';

class UserBill {
  //======================== Variables
  final String startPoint, endPoint, carId, phone;
  Driver driver;
  DriverLite driverLite;
  UserBillCollectionHandler handler = UserBillCollectionHandler();
  DateTime dateTime;
  //======================== End
  UserBill(this.startPoint, this.endPoint, this.carId, this.phone,
      {this.driver, this.driverLite});

  //======================== Functions
  Future<void> addBill() async {
    dateTime = DateTime.now();
    await handler.addBill(this, this.phone);
  }
}
