import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Tools/CollectionOfSittingOptions.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Widgets/App%20SittingOption.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SittingOptions {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar,
      //=============================================
      //=============================================
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        color: Color(0xffefefef),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                'محمد علي',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: sittingOptionsElements.entries
                    .map(
                      (option) => SittingOption(
                        title: option.key,
                        iconPath: option.value,
                        onTap: sittingOptionsFunctions(context)[option.key],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      //=============================================
      //=============================================
      bottomNavigationBar: UserHomeNavigationBar(
        parentContext: context,
        index: 0,
        arguments: user,
      ),
    );
  }
}

// SittingOption(
//               title: "إعدادات الحساب",
//               iconPath: 'Images/sittingsicons.png',
//             ),
//             Divider(
//               thickness: 3,
//               color: Color(0xff909090),
//               height: 0,
//             ),
//             SittingOption(
//               title: "مركز المساعده",
//               iconPath: 'Images/sittingsicons.png',
//             ),
//             Divider(
//               thickness: 3,
//               color: Color(0xff909090),
//               height: 0,
//             ),
//             SittingOption(
//               title: "الابلاغ عن مشكله",
//               iconPath: 'Images/sittingsicons.png',
//             ),
//             Divider(
//               thickness: 3,
//               color: Color(0xff909090),
//               height: 0,
//             ),
//             SittingOption(
//               title: "اعرف عن التطبيق",
//               iconPath: 'Images/sittingsicons.png',
//             ),
//             Divider(
//               thickness: 3,
//               color: Color(0xff909090),
//               height: 0,
//             ),
//             SittingOption(
//               title: "تسجيل الخروج",
//               iconPath: 'Images/sittingsicons.png',
//             ),


