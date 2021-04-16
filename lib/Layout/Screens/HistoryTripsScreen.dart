import 'package:flutter/material.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Widgets/App%20TripCard.dart';

class HistroyTripsScreen extends StatefulWidget {
  HistroyTripsScreen({this.data});
  final Map<String, dynamic> data;
  @override
  _HistroyTripsScreenState createState() => _HistroyTripsScreenState();
}

class _HistroyTripsScreenState extends State<HistroyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      //==========================================
      //==========================================
      body: Container(
        color: Color(0xffefefef),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "الرحلات السابقه",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => TripCard(
                  driver: Driver('Mohamed', '+201094127310', 100, ''),
                ),
              ),
            ),
          ],
        ),
      ),
      //==========================================
      //==========================================
      bottomNavigationBar: NavigationBar(
        parentContext: context,
      ),
    );
  }
}
