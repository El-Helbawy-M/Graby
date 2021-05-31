import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Remember {
  String number;
  Future<bool> remember(BuildContext context) async {
    SharedPreferences prefs;
    while (prefs == null) prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('UD_Number')) prefs.setString('UD_Number', '');
    this.number = prefs.getString('UD_Number');
    return prefs.getString('UD_Number').isNotEmpty;
  }

  Future<void> setUDNumber(String phone) async {
    SharedPreferences prefs;
    while (prefs == null) prefs = await SharedPreferences.getInstance();
    prefs.setString('UD_Number', phone);
  }
}
