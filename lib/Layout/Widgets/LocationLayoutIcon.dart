import 'package:flutter/material.dart';

class LocationLayoutIcon extends StatelessWidget {
  const LocationLayoutIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 20,
          child: VerticalDivider(
            thickness: 1,
            color: Colors.blue,
          ),
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('Images/Location Icon.png'),
            ),
          ),
        )
      ],
    );
  }
}
