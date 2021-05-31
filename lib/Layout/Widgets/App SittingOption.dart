import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SittingOption extends StatelessWidget {
  const SittingOption({this.title, this.iconPath, this.onTap, this.value});
  final title, iconPath, onTap, value;
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
                if (title == 'محفظتك')
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(value.toString(), style: TextStyle(color: Colors.green)),
                  )
                else if (title != "تسجيل الخروج")
                  Icon(FontAwesomeIcons.angleLeft, color: Colors.grey),
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
