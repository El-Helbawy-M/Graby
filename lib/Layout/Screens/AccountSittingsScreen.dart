import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';

class AccountSittingsScreen extends StatefulWidget {
  AccountSittingsScreen({Key key}) : super(key: key);

  @override
  _AccountSittingsScreenState createState() => _AccountSittingsScreenState();
}

class _AccountSittingsScreenState extends State<AccountSittingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      //======================================
      //======================================
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(bottom: 20),
        color: Color(0xffefefef),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                  )
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      FontAwesomeIcons.angleLeft,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Text(
                        'إعدادات الحساب',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('Images/sittingsicons.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            Divider(height: 10, color: Colors.black),
            AccountSittingsElement(
              label: 'رقم الهاتف المحمول',
              data: '+20000000000',
            ),
            Divider(height: 10, color: Colors.black),
            AccountSittingsElement(
              label: 'كلمة المرور',
              data: '00000000',
            ),
            Divider(height: 10, color: Colors.black),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('حفظ التعديلات',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.solidSave,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //======================================
      //======================================
      bottomNavigationBar: UserHomeNavigationBar(
        parentContext: context,
      ),
    );
  }
}

class AccountSittingsElement extends StatelessWidget {
  AccountSittingsElement({this.data, this.label}) {
    if (label == 'كلمة المرور') {
      for (int x = 0; x < data.length; x++) {
        obScure += ".";
      }
    }
  }
  final String label, data;
  String obScure = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (label != 'كلمة المرور') ? data : obScure,
                style: TextStyle(
                  color: Colors.black45,
                  letterSpacing: (label != 'كلمة المرور') ? null : 4,
                  fontSize: (label != 'كلمة المرور') ? 14 : 20,
                ),
              ),
              Icon(CupertinoIcons.pen, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
