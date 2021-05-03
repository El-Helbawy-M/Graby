import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Data/Models/User.dart';

class Auther {
  //==================================== variables
  bool check;
  Map clientData, userHandler;
  String phone;
  //==================================== End
  Auther(this.clientData, this.phone);
  //==================================== Functions
  Future<User> createNewUser() async {
    UserCollectionHandler handler =
        UserCollectionHandler(this.clientData['Phone']);
    while (check == null) check = await handler.createNewUser(this.clientData);
    return User(
      this.clientData['Name'],
      this.clientData['Phone'],
      this.clientData['Balance'],
      this.clientData['Points'],
    );
  }

  Future<Driver> createNewDriver() async {
    DriverCollectionHandler handler = DriverCollectionHandler(
      this.clientData['Phone'],
    );
    while (check == null)
      check = await handler.createNewDriver(this.clientData);
    return Driver(
      this.clientData['Name'],
      this.clientData['Phone'],
      this.clientData['Balance'],
      this.clientData['Image'],
      2,
    );
  }

  Future<User> getUser() async {
    while (this.userHandler == null)
      this.userHandler = await UserCollectionHandler(
        this.phone,
      ).getUserData();
    if (this.userHandler.isNotEmpty)
      return User(
        this.userHandler['Name'],
        this.userHandler['Phone'],
        this.userHandler['Balance'],
        this.userHandler['Points'],
      );
    else
      return User.empty();
  }

  Future<Driver> getDriver() async {
    while (this.userHandler == null)
      this.userHandler = await DriverCollectionHandler(
        this.clientData['Phone'],
      ).getDriverData();
    if (this.userHandler.isNotEmpty)
      return Driver(
        this.userHandler['Name'],
        this.userHandler['Phone'],
        this.userHandler['Balance'],
        this.userHandler['Image'],
        2,
      );
    else
      return Driver.empty();
  }
  //==================================== End
}
