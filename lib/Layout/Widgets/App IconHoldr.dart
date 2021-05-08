import 'package:flutter/material.dart';

class IconHoldeer extends StatelessWidget {
  const IconHoldeer({this.height = 40, this.width = 40, this.icon});

  final double width, height;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            icon,
          ),
        ),
      ),
    );
  }
}
