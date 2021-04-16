import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserHomeNavigationBar extends StatefulWidget {
  UserHomeNavigationBar({this.parentContext});
  final BuildContext parentContext;
  @override
  _UserHomeNavigationBarState createState() => _UserHomeNavigationBarState();
}

class _UserHomeNavigationBarState extends State<UserHomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Center(
        child: BottomNavigationBar(
          elevation: 0,
          iconSize: 30,
          currentIndex: 1,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              label: 'المزيد',
              icon: Icon(
                CupertinoIcons.ellipsis,
              ),
            ),
            BottomNavigationBarItem(
              label: 'الموقف',
              icon: FaIcon(FontAwesomeIcons.bus),
            ),
            BottomNavigationBarItem(
              label: 'الرئيسية',
              icon: FaIcon(FontAwesomeIcons.home),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverHomeNavigationBar extends StatefulWidget {
  DriverHomeNavigationBar({this.parentContext});
  final BuildContext parentContext;
  @override
  _DriverHomeNavigationBarState createState() =>
      _DriverHomeNavigationBarState();
}

class _DriverHomeNavigationBarState extends State<DriverHomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Center(
        child: BottomNavigationBar(
          elevation: 0,
          iconSize: 30,
          currentIndex: 1,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              label: 'المزيد',
              icon: Icon(
                CupertinoIcons.ellipsis,
              ),
            ),
            BottomNavigationBarItem(
              label: 'الرئيسية',
              icon: FaIcon(FontAwesomeIcons.home),
            ),
          ],
        ),
      ),
    );
  }
}
