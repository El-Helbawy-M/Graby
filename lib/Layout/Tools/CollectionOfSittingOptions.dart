import 'package:flutter/material.dart';
import 'package:graby/Domain/Use%20Cases/Remember.dart';

mixin SittingOptions {
  Map<String, String> sittingOptionsElements(bool check) => {
        'إعدادات الحساب': 'Images/App Icons/sittingsicons.png',
        if (check) 'محفظتك': "Images/App Icons/walleticon.png",
        'مركز المساعده': 'Images/App Icons/helpicon.png',
        "الابلاغ عن مشكله": 'Images/App Icons/warraningicon.png',
        'اعرف عن التطبيق': 'Images/App Icons/infoicon.png',
        'تسجيل الخروج': 'Images/App Icons/signouticon.png',
      };

  Map<String, Function> sittingOptionsFunctions(BuildContext context) => {
        'إعدادات الحساب': () {},
        'محفظتك': () {},
        'مركز المساعده': () {},
        "الابلاغ عن مشكله": () {},
        'اعرف عن التطبيق': () {},
        'تسجيل الخروج': () {
          Remember().setUDNumber('');
          return Navigator.pushNamedAndRemoveUntil(context, 'RegisterScreen', (route) => false);
        },
      };
}
