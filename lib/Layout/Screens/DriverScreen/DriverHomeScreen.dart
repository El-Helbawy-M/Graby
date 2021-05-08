import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class DriverHomeScreen extends StatefulWidget {
  DriverHomeScreen({Key key}) : super(key: key);

  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  Driver driver;
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
                if (snapshot != null) {
                  Map data = snapshot.data.data();
                  driver = Driver(
                    data['Name'],
                    data['Phone'],
                    data['Balance'],
                    data['Image'],
                    data['Price'],
                    data['Car Number'],
                  );
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //================== C1
                      Container(
                        color: Color(0xffefefef),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                                      'فلوسك في اليوم',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
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
                                Text(
                                  "${driver.balance.toString()}  جنيه",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                )
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
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'فلوس الرحله الحاليه',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
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
                                    Text('جنيه 50'),
                                  ],
                                ),
                              ),
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
                                onPressed: () {},
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
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'لقد تم دفع الاجره بواسطة',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(),
                                    ),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'محمود أسامه',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '+2000000000',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  Text(
                                                    'رقم الهاتف',
                                                    style:
                                                        TextStyle(fontSize: 10),
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
                              SizedBox(height: 20)
                            ],
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
      ),
    );
  }
}
