import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graby/Data/DataBase/Cloud%20Firestore%20.dart';

class DirverBillCollectionHandler extends DataBase {
  String _name;
  DirverBillCollectionHandler(this._name) : super("Driver Tribes");
  Stream<DocumentSnapshot> getSnapshot() => getDocumentSnapshot(this._name);
  Future<void> addUser(Map<String, dynamic> data) => updateDocument(this._name, data);
  Future<void> clearUsers() async => clearDocument(this._name);
}
