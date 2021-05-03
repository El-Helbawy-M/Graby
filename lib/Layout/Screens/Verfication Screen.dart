import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Domain/Use%20Cases/Auther.dart';
import 'package:graby/Layout/Screens/UserHomeScreen.dart';
import 'package:graby/Layout/Tools/VerficationTimer.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:verify_code_input/verify_code_input.dart';

import '../../Data/DataBase/FireBase Auther.dart';

class VerfyScreen extends StatefulWidget {
  const VerfyScreen({this.clientData, this.auther, this.phone});
  final Map<String, dynamic> clientData;
  final PhoneAuther auther;
  final String phone;
  @override
  _VerfyScreenState createState() => _VerfyScreenState();
}

class _VerfyScreenState extends State<VerfyScreen> {
  bool check;
  User user;
  Driver driver;
  String code;
  Timer timer;
  VerficationTimer vTimer = VerficationTimer();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (vTimer.minutes == 0) {
          timer.cancel();
          Navigator.pop(context);
        } else
          vTimer.runTime();
        setState(() {});
      },
    );
  }

  //======================================= Functions
  void writngCode(String number) => setState(() => code = number);

  //======================================= End

  @override
  Widget build(BuildContext context) {
    Auther auther = Auther(widget.clientData, widget.phone);
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('final.png'),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'سيتم ارسال كود التأكيد إلي هذا الرقم',
                  style: TextStyle(color: Colors.black, fontFamily: 'Cairo'),
                  children: [
                    TextSpan(
                      text: '\n${widget.phone}',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ]),
              textAlign: TextAlign.center,
            ),
            VerfyCodeField(onChange: writngCode),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${vTimer.minutes}:${vTimer.seconds}'),
                  InkWell(
                    onTap: () {},
                    child: Text('أرسال الكود مرة اخري'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
                right: 60,
                left: 60,
              ),
              child: SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: () async {
                    if (code.length == 6) {
                      showDialog(
                        context: context,
                        builder: (context) => loadinDialog,
                      );
                      while (check == null) {
                        check = await widget.auther.verifySMS(code);
                      }
                      if (check) {
                        if (widget.clientData == null) {
                          while (this.user == null)
                            this.user = await auther.getUser();
                          if (this.user.isEmpty) {
                            this.driver = await auther.getDriver();
                          }
                          check = true;
                        } else if (widget.clientData["Price"] == null) {
                          while (user == null)
                            user = await auther.createNewUser();
                        } else {
                          while (driver == null)
                            driver = await auther.createNewDriver();
                        }
                        Navigator.pop(context);

                        if (check && (user == null || driver == null)) {
                          timer.cancel();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            'UserHomeScreen',
                            (route) => false,
                            arguments: (user.isEmpty) ? driver : user,
                          );
                        }
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'تأكيد إنشاء حساب',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}

class VerfyCodeField extends StatelessWidget {
  const VerfyCodeField({this.onChange});
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      child: VerifyCodeInput(
        onValueChanged: onChange,
      ),
    );
  }
}




// Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           6,
//           (index) => SizedBox(
//             width: 40,
//             child: TextFormField(
//               textAlign: TextAlign.center,
//               maxLength: 1,
//               decoration: InputDecoration(
//                 counterText: '',
//               ),
//               onChanged: (str) {
//                 onChange(str, index);
//               },
//             ),
//           ),
//         ),
//       )