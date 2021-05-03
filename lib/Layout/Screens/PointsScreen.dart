import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Use%20Cases/ConvertPoints.dart';
import 'package:graby/Domain/Use%20Cases/PayFare.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20ConfirmationButton.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class PointsScreen extends StatefulWidget {
  PointsScreen({this.user});
  final User user;
  @override
  _PointsScreenState createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  //================================= Variables
  User user;
  //================================= End

  //================================= Functions
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  //================================= End
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //==========================================
      //==========================================
      appBar: appBar,
      //==========================================
      //==========================================
      body: StreamBuilder<DocumentSnapshot>(
          stream: UserCollectionHandler(user.phone).getSnapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              Map data = snapshot.data.data();
              user = User(
                data['Name'],
                data['Phone'],
                data['Balance'],
                data['Points'],
              );
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xffefefef),
                    ),
                    Positioned(
                      bottom: -30,
                      child: Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('Images/Bitcoin-rafiki.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'نقاطي',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                          ),
                        ),
                        Row(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('عدد نقاطك'),
                                      Text(user.points.toString(),
                                          style: TextStyle(color: Colors.blue)),
                                      Divider(thickness: 2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('رصيدك المالي'),
                                      Text(
                                        user.balance.toString(),
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Divider(thickness: 2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                        Container(
                          height: 50,
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '5  نقاط\t\t\t\t = \t\t\t\t1  جنيه',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        ConfirmationButton(
                          onPressed: PointsHandler(user, context).convert,
                          text: 'حول النقاط',
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
      //==========================================
      //==========================================
      bottomNavigationBar: UserHomeNavigationBar(
        parentContext: context,
        index: 2,
        arguments: user,
      ),
    );
  }
}
