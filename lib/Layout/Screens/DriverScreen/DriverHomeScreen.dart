import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Handlers/DriverBillCollectionHandler.dart';
import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Layout/Tools/DriverTripController.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class DriverHomeScreen extends StatefulWidget {
  DriverHomeScreen({Key key}) : super(key: key);

  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  Driver driver;
  DriverTripController controller = DriverTripController();
  Timer timer;
  String userName, userPhone, buffer;
  @override
  Widget build(BuildContext context) {
    Driver metadriver = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: StreamBuilder<DocumentSnapshot>(
              stream: DriverCollectionHandler(metadriver.phone).getSnapshots(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  Map data = snapshot.data.data();
                  driver = Driver(data['Name'], data['Phone'], data['Balance'], data['Image'], data['Price'], data['Car Number'], data['Start Point'], data['End Point']);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //================== C1
                      Container(
                        color: Color(0xffefefef),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'فلوسك   في   اليوم',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 11),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'Images/App Icons/Wallet Balllance.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text("${driver.balance.toString()}  جنيه", textDirection: TextDirection.rtl, textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        ),
                      ),
                      //==================
                      SizedBox(height: 15),
                      //================== C2
                      Container(
                        color: Color(0xffefefef),
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              // ignore: deprecated_member_use
                              overflow: Overflow.visible,
                              alignment: Alignment.topRight,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('فلوس الرحله الحاليه', textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'Images/App Icons/Home Icons/dollar.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text('جنيه ${controller.users * 2}'),
                                      ],
                                    ),
                                  ),
                                ),
                                if (controller.notifaction)
                                  Positioned(
                                    right: -10,
                                    top: -10,
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade400),
                                      child: Center(child: Text(controller.users.toString())),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 100,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  if (controller.running) {
                                    timer.cancel();
                                    controller.end(driver.phone);
                                  }
                                  controller.start();
                                  timer = Timer.periodic(
                                    Duration(seconds: 1),
                                    (timer) {
                                      setState(() {});
                                      if (controller.checkTime()) {
                                        timer.cancel();
                                        controller.end(driver.phone);
                                      }
                                    },
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'رحله جديده',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //==================
                      SizedBox(height: 15),
                      //================== C3
                      Container(
                        color: Color(0xffefefef),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: (controller.running)
                              ? StreamBuilder<DocumentSnapshot>(
                                  stream: DirverBillCollectionHandler(driver.phone).getSnapshot(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data != null) {
                                      if (snapshot.data.data().isNotEmpty) {
                                        userName = snapshot.data.data().keys.first;
                                        userPhone = snapshot.data.data().values.first;
                                        if (buffer == null || userPhone != buffer) {
                                          buffer = userPhone;
                                          controller.showNotifaction();
                                        }

                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'لقد تم دفع الاجره بواسطة',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              color: Colors.blue,
                                              margin: EdgeInsets.only(top: 5),
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            userName,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 6),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text(
                                                                  userPhone,
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 10,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'رقم الهاتف',
                                                                  style: TextStyle(
                                                                    fontSize: 10,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        CupertinoIcons.person,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        );
                                      } else
                                        return Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                    } else
                                      return Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Center(child: Text('لم يتم دفع الاجره بعد')),
                                      );
                                  },
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Center(
                                    child: Text('لا توجد رحله حاليه'),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
      bottomNavigationBar: DriverHomeNavigationBar(
        parentContext: context,
        index: 1,
        arguments: (driver == null) ? metadriver : driver,
        function: () {
          if (controller.running) {
            timer.cancel();
            controller.end(driver.phone);
          }
        },
      ),
    );
  }
}
