import 'package:graby/Data/DataBase/Cloud%20Firestore%20.dart';

class UserCollectionHandler extends DataBase {
  UserCollectionHandler(this._name) : super('Users');
  //=================================== Variables
  String _name;
  //=================================== End
  //=================================== Functions
  Future<bool> createNewUser(Map<String, dynamic> data) async =>
      createNewDocument(this._name, data);
  Future<bool> updateUser(Map<String, dynamic> data) async =>
      updateDocument(this._name, data);
  Future<Map<String, dynamic>> getUserData() async => getDocument(this._name);
  //=================================== End
}
