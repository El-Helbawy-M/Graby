import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      //=============================================
      //=============================================
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        color: Color(0xffefefef),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            SittingOption(
              title: "إعدادات الحساب",
              iconPath: 'Images/sittingsicons.png',
            ),
            Divider(
              thickness: 3,
              color: Color(0xff909090),
              height: 0,
            ),
            SittingOption(
              title: "إعدادات الحساب",
              iconPath: 'Images/sittingsicons.png',
            ),
            Divider(
              thickness: 3,
              color: Color(0xff909090),
              height: 0,
            ),
            SittingOption(
              title: "إعدادات الحساب",
              iconPath: 'Images/sittingsicons.png',
            ),
            Divider(
              thickness: 3,
              color: Color(0xff909090),
              height: 0,
            ),
            SittingOption(
              title: "إعدادات الحساب",
              iconPath: 'Images/sittingsicons.png',
            ),
            Divider(
              thickness: 3,
              color: Color(0xff909090),
              height: 0,
            ),
            SittingOption(
              title: "إعدادات الحساب",
              iconPath: 'Images/sittingsicons.png',
            ),
          ],
        ),
      ),
      //=============================================
      //=============================================
      bottomNavigationBar: NavigationBar(
        parentContext: context,
      ),
    );
  }
}

class SittingOption extends StatelessWidget {
  const SittingOption({
    this.title,
    this.iconPath,
  });
  final title, iconPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
            ),
          ],
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.grey,
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(iconPath),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
