import 'package:graby/Data/DataBase/Cloud%20Firestore%20.dart';
import 'package:graby/Domain/Repo/UserBill.dart';
import 'package:graby/Domain/Repo/DriverLite.dart';

class UserBillCollectionHandler extends DataBase {
  UserBillCollectionHandler() : super('User Tribes');

  //=============================== Functions
  Future<void> createAccount(String phone) async => await createNewDocument(phone, {});

  Future<void> addBill(UserBill bill, String name) async {
    int day = bill.dateTime.day, year = bill.dateTime.year, month = bill.dateTime.month, hour = bill.dateTime.hour, minute = bill.dateTime.minute;
    Map<String, Map<String, dynamic>> data = {
      "Bill $day  $month  $year \t $hour:$minute": {
        'Driver Name': bill.driver.name,
        'Phone': bill.driver.phone,
        'Start Point': bill.startPoint,
        'End Point': bill.endPoint,
        'Car Id': bill.carId,
        'Date Time': '$day / $month / $year \t $hour:$minute',
        'Price': bill.driver.price,
      },
    };
    await updateDocument(name, data);
  }

  Future<List<UserBill>> gitBills(String userPhone) async {
    Map<String, dynamic> data;
    List<UserBill> bills = [];
    while (data == null) data = await getDocument(userPhone);
    if (data.isNotEmpty) {
      bills = data.values
          .map((bill) => UserBill(
                bill['Start Point'],
                bill['End Point'],
                bill['Car Id'],
                userPhone,
                driverLite: DriverLite(
                  bill['Driver Name'],
                  bill['Phone'],
                  bill['Price'],
                  '',
                ),
              ))
          .toList();

      print(bills);
    }
    return bills;
  }
}
