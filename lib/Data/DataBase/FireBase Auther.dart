import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graby/Layout/Screens/Verfication%20Screen.dart';

class PhoneAuther {
  //================================================ Variables
  FirebaseAuth auth = FirebaseAuth.instance;
  String verficationId, phone, name;
  BuildContext context;
  PhoneAuther(this.phone, this.context);
  Map<String, dynamic> data;
  setData(String name, Map<String, dynamic> data) {
    this.name = name;
    this.data = data;
  }
  //================================================ End

  //================================================ inside acts
  void _codeSent(String verficationId, int token) {
    this.verficationId = verficationId;
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerfyScreen(
          clientData: this.data,
          auther: this,
          phone: phone,
        ),
      ),
    );
  }

  void _callSuccess(PhoneAuthCredential credential) => print("It's good");
  void _callFail(FirebaseAuthException exception) => print(exception.message);
  void _callTimeOut(String s) => print(s);
  //================================================ End

  //================================================ Functions
  Future<void> signInNumber() async {
    auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 120),
      verificationCompleted: _callSuccess,
      verificationFailed: _callFail,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _callTimeOut,
    );
  }

  Future<bool> verifySMS(String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this.verficationId, smsCode: smsCode);
    UserCredential user;
    bool check = false;
    try {
      user = await auth.signInWithCredential(phoneAuthCredential);
    } catch (e) {
      print('a7a');
    }
    if (user != null) check = true;
    return check;
  }

  signOut() => auth.signOut();
  //================================================ End
}
