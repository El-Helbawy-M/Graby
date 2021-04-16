import 'package:flutter/material.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class DriverHomeScreen extends StatefulWidget {
  DriverHomeScreen({Key key}) : super(key: key);

  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            color: Color(0xffefefef),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'فلوسك في اليوم',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('Images/Wallet Balllance.png')),
                        ),
                      ),
                    ],
                  ),
                  Text('50جنيه')
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xffefefef),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            // child: Card
          ),
          Container(
            color: Color(0xffefefef),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          ),
        ],
      ),
      bottomNavigationBar: DriverHomeNavigationBar(
        parentContext: context,
      ),
    );
  }
}
