import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SittingOption extends StatelessWidget {
  const SittingOption({
    this.title,
    this.iconPath,
    this.onTap,
  });
  final title, iconPath, onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
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
                (title != "تسجيل الخروج")
                    ? Icon(
                        FontAwesomeIcons.angleLeft,
                        color: Colors.grey,
                      )
                    : SizedBox(),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 30,
                        height: 30,
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
        ),
        (title != "تسجيل الخروج")
            ? Divider(
                thickness: 3,
                color: Color(0xff909090),
                height: 0,
              )
            : SizedBox(),
      ],
    );
  }
}
