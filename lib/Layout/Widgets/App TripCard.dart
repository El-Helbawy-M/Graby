import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'LocationLayoutIcon.dart';

class TripCard extends StatelessWidget {
  const TripCard({this.data});

  //========================= Varibales
  final Map<String, dynamic> data;
  //========================= End

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Stack(
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.clear,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(CupertinoIcons.person),
                    ),
                  ),
                  Text(
                    data['Driver Name'],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'رقم الهاتف',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.mobileAlt,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              data['Phone'],
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    data['Start Point'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    data['End Point'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            LocationLayoutIcon(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\t\t\t\t\t\t  التاريخ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  FontAwesomeIcons.calendarAlt,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              data['Date Time'],
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'رقم السياره',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  CupertinoIcons.bus,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              data['Car Id'],
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -20,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: Text(
                    '   المبلغ :    ${data['Price']} جنيه ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
