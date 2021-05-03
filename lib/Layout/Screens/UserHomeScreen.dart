import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Use%20Cases/PayFare.dart';
import 'package:graby/Domain/Use%20Cases/ScanQrCode.dart';
import 'package:graby/Layout/Screens/HistoryTripsScreen.dart';
import 'package:graby/Layout/Screens/PaymentScreen.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Screens/PointsScreen.dart';
import 'package:qrscan/qrscan.dart';

class UserHomeScreen extends StatefulWidget {
  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  //============================== Variables
  User user;
  Map<String, dynamic> data;
  //============================== End
  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context).settings.arguments;
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
            data = snapshot.data.data();
            user.balance = data['Balance'];
            user.points = data['Points'];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xfff5f5f5),
                    margin: EdgeInsets.only(
                      top: 40,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'رصيدك الحالي',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Cairo',
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 7),
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
                                  Text(
                                    '${data['Balance']} جنيه',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'إشحن\nمحفظتك',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    IconHoldeer(
                                      width: 30,
                                      height: 30,
                                      icon:
                                          'Images/App Icons/Home Icons/business.png',
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xfff5f5f5),
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'إدفع الأجره',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ),
                          IconHoldeer(
                            width: 120,
                            height: 120,
                            icon: 'Images/App Icons/Home Icons/QR codde.png',
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffd6d6d6),
                            ),
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.camera_fill,
                              ),
                              onPressed: () async =>
                                  await Scanner(context, user).scan(),
                              color: Color(0xff8e8e8e),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xfff5f5f5),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async => user = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PointsScreen(user: user),
                              ),
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              elevation: 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 26,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'نقاطي',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Cairo',
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconHoldeer(
                                      width: 30,
                                      height: 30,
                                      icon:
                                          'Images/App Icons/Home Icons/increase.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              'HistoryScreen',
                              arguments: user,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              elevation: 10,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'الرحلات\nالسابقه',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Cairo',
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconHoldeer(
                                      width: 30,
                                      height: 30,
                                      icon:
                                          'Images/App Icons/Home Icons/road.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.white,
                            elevation: 10,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'تحويل\nالفلوس',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Cairo',
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconHoldeer(
                                    width: 30,
                                    height: 30,
                                    icon:
                                        'Images/App Icons/Home Icons/transfer.png',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
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
