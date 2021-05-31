import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Use%20Cases/Auther.dart';
import 'package:graby/Domain/Use%20Cases/Remember.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  //============================= Variables
  int time = 0;
  AnimationController animationController;
  Animation animation, animation2;
  var remember = Remember();
  //=============================

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(end: 200, begin: 300).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      if (animationController.isCompleted) animationController.reverse();
      if (animationController.isDismissed) animationController.forward();
      setState(() {});
    });
    Timer.periodic(Duration(seconds: 10), run);
    super.initState();
  }

  run(Timer timer) async {
    timer.cancel();
    if (!await remember.remember(context)) {
      animationController.stop();

      Navigator.pushNamedAndRemoveUntil(context, 'LoginScreen', (route) => false);
    } else {
      Auther auther = Auther.emptyInstence(remember.number);
      User user;
      Driver driver;
      while (user == null) user = await auther.getUser();
      if (user.isEmpty) {
        driver = await auther.getDriver();
      }
      animationController.stop();
      if (user != null || driver != null) {
        (user == null || user.isEmpty)
            ? Navigator.pushNamedAndRemoveUntil(context, 'DriverHomeScreen', (route) => false, arguments: driver)
            : Navigator.pushNamedAndRemoveUntil(
                context,
                'UserHomeScreen',
                (route) => false,
                arguments: user,
              );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //=========================================
      //=========================================
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Images/final.png'),
            ),
          ),
        ),
      ),
    );
  }
}
