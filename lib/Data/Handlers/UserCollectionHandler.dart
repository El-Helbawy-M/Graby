import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graby/Data/DataBase/Cloud%20Firestore%20.dart';
import 'package:graby/Data/Handlers/UserBillCollectionHandler.dart';

class UserCollectionHandler extends DataBase {
  UserCollectionHandler(this._name) : super('Users');
  UserBillCollectionHandler billHandler = UserBillCollectionHandler();
  //=================================== Variables
  String _name;
  //=================================== End
  //=================================== Functions
  Future<bool> createNewUser(Map<String, dynamic> data) async {
    await billHandler.createAccount(this._name);
    return await createNewDocument(this._name, data);
  }

  Future<bool> updateUser(Map<String, dynamic> data) async =>
      updateDocument(this._name, data);
  Future<Map<String, dynamic>> getUserData() async => getDocument(this._name);
  Stream<DocumentSnapshot> getSnapshots() =>
      super.getDocumentSnapshot(this._name);
  //=================================== End
}
