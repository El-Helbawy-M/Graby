import 'package:flutter/material.dart';

mixin SittingOptions {
  Map<String, String> sittingOptionsElements = {
    'إعدادات الحساب': 'Images/App Icons/sittingsicons.png',
    'مركز المساعده': 'Images/App Icons/helpicon.png',
    "الابلاغ عن مشكله": 'Images/App Icons/warraningicon.png',
    'اعرف عن التطبيق': 'Images/App Icons/infoicon.png',
    'تسجيل الخروج': 'Images/App Icons/signouticon.png',
  };

  Map<String, Function> sittingOptionsFunctions(BuildContext context) => {
        'إعدادات الحساب': () {},
        'مركز المساعده': () {},
        "الابلاغ عن مشكله": () {},
        'اعرف عن التطبيق': () {},
        'تسجيل الخروج': () => Navigator.pushNamedAndRemoveUntil(
              context,
              'RegisterScreen',
              (route) => false,
            ),
      };
}
