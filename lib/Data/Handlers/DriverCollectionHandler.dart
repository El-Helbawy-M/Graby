import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graby/Data/DataBase/Cloud%20Firestore%20.dart';

class DriverCollectionHandler extends DataBase {
  DriverCollectionHandler(this.name) : super('Drivers');
  //=================================== Variables
  String name;
  //=================================== End
  //=================================== Functions
  Future<bool> createNewDriver(Map<String, dynamic> data) async =>
      createNewDocument(this.name, data);
  Future<bool> updateDriver(Map<String, dynamic> data) async =>
      updateDocument(this.name, data);
  Future<Map<String, dynamic>> getDriverData() => getDocument(this.name);
  Stream<DocumentSnapshot> getSnapshots() =>
      super.getDocumentSnapshot(this.name);
  //=================================== End
}
