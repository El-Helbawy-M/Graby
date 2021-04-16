import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AlertDialog loadinDialog = AlertDialog(
  shape: CircleBorder(),
  content: Container(
    height: 150,
    width: 150,
    child: Center(child: CircularProgressIndicator()),
  ),
);
//ssd
AlertDialog done = AlertDialog(
  shape: CircleBorder(),
  content: Container(
    height: 150,
    width: 150,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Center(
              child: Icon(
                CupertinoIcons.checkmark,
                color: Colors.green,
                size: 100,
              ),
            ),
          ),
          Text(
            'تم الدفع',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    ),
  ),
);

Dialog newTrip(BuildContext context, int balance) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.blue,
      child: Container(
        width: MediaQuery.of(context).size.width - 250,
        height: MediaQuery.of(context).size.height - 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.clear_thick_circled,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Text(
              'رحله موفقه 😊\nشكرا لك علي استخدامك\nتطبيق جرابي لدفع الأجره',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  'رصيدك : $balance جنيه',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Images/investment.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
