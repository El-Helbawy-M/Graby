import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({this.parentContext});
  final BuildContext parentContext;
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
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
