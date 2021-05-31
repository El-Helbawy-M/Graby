import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Widgets/App%20TripCard.dart';

class HistroyTripsScreen extends StatefulWidget {
  @override
  _HistroyTripsScreenState createState() => _HistroyTripsScreenState();
}

class _HistroyTripsScreenState extends State<HistroyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    final User userPhone = ModalRoute.of(context).settings.arguments;
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
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('User Tribes').doc(userPhone.phone).get().asStream(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    List data = snapshot.data.data().values.toList();
                    data.sort(
                      (a, b) {
                        var first = a['Date Time'];
                        var second = b['Date Time'];
                        return second.compareTo(first);
                      },
                    );
                    // print(data);
                    return ListView(
                      shrinkWrap: true,
                      reverse: false,
                      children: data
                          .map(
                            (billData) => TripCard(
                              data: billData,
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                        child: Center(child: CircularProgressIndicator()),
                        width: 150,
                        height: 150,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      //==========================================
      //==========================================
      bottomNavigationBar: UserHomeNavigationBar(
        parentContext: context,
        index: 2,
        arguments: userPhone,
      ),
    );
  }
}
