import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  int time = 0;
  AnimationController animationController;
  Animation animation, animation2;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation =
        Tween<double>(end: 200, begin: 300).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      if (animationController.isCompleted) animationController.reverse();
      if (animationController.isDismissed) animationController.forward();
      setState(() {});
    });
    Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        timer.cancel();
        animationController.stop();
        Navigator.pushNamedAndRemoveUntil(
            context, 'LoginScreen', (route) => false);
      },
    );
    super.initState();
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
