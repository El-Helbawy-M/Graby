import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Use%20Cases/PayFare.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20ConfirmationButton.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({this.handler, this.user});
  final PayHandler handler;
  final User user;
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future<void> pay() async {
    showDialog(
      context: context,
      builder: (context) => loadinDialog,
    );
    bool check;
    while (check == null) check = await widget.handler.pay();
    Navigator.pop(context);
    if (check) {
      showDialog(
        context: context,
        builder: (context) => done,
      );
      Timer(
        Duration(seconds: 1),
        () async {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      //=============================================
      //=============================================
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                children: [
                  Container(
                    color: Color(0xfff5f5f5),
                  ),
                  Positioned(
                    bottom: -70,
                    child: Opacity(
                      opacity: .3,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('Images/Bitcoin P2P-pana.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'إدفعلي الأجره',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.blue,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'بيانات العميل',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.blue,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.handler.driver.name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      width: 70,
                                      height: 70,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300],
                                      ),
                                      child: Center(
                                        child: Icon(CupertinoIcons.person),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.handler.driver.phone,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        ' : رقم الهاتف',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset.fromDirection(2, 2),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  color: Color(0xffc7c7c7),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -20,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '   المبلغ :    ${widget.handler.driver.price} جنيه ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ConfirmationButton(
                        onPressed: pay,
                        text: 'تأكيد عملية الدفع',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //=============================================
      //=============================================
      bottomNavigationBar: UserHomeNavigationBar(
        parentContext: context,
        index: 2,
      ),
    );
  }
}
