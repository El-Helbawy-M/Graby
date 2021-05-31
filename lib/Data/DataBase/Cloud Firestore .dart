import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  String collectionPath;
  FirebaseFirestore manger = FirebaseFirestore.instance;
  DataBase(this.collectionPath);
  Future<bool> createNewDocument(
    String docPath,
    Map<String, dynamic> data,
  ) async {
    bool check = false;
    try {
      await manger.collection(this.collectionPath).doc(docPath).set(data);
      check = true;
    } catch (error) {
      print(error);
    }
    return check;
  }

  Future<bool> setDocumentData(String docPath, Map<String, dynamic> data) async {
    bool check = false;
    try {
      await manger.collection(this.collectionPath).doc(docPath).set(data);
      check = true;
    } catch (error) {
      print(error);
    }
    return check;
  }

  Future<bool> updateDocument(String docPath, Map<String, dynamic> data) async {
    bool check = false;
    try {
      await manger.collection(this.collectionPath).doc(docPath).update(data);
      check = true;
    } catch (error) {
      print(error);
    }
    return check;
  }

  Future<Map<String, dynamic>> getDocument(String docPath) async {
    Map<String, dynamic> data;
    try {
      DocumentSnapshot snapshot = await this.manger.collection(this.collectionPath).doc(docPath).get();
      data = snapshot.data();
    } catch (e) {}
    return (data != null) ? data : {};
  }

  Stream<DocumentSnapshot> getDocumentSnapshot(String docPath) => this.manger.collection(this.collectionPath).doc(docPath).snapshots();

  Future<bool> clearDocument(String docPath) async {
    try {
      await this.manger.collection(this.collectionPath).doc(docPath).set({});
      return true;
    } catch (e) {
      return false;
    }
  }
}
