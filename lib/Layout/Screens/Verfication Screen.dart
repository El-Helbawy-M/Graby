import 'package:flutter/material.dart';
import 'package:graby/Data/Handlers/DriverCollectionHandler.dart';
import 'package:graby/Data/Handlers/UserCollectionHandler.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Screens/UserHomeScreen.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';

import '../../Data/DataBase/FireBase Auther.dart';

class VerfyScreen extends StatefulWidget {
  const VerfyScreen({this.clientData, this.auther});
  final Map<String, dynamic> clientData;
  final PhoneAuther auther;
  @override
  _VerfyScreenState createState() => _VerfyScreenState();
}

class _VerfyScreenState extends State<VerfyScreen> {
  bool check;
  var op, userHandler;
  List code = List.generate(6, (index) => "");
  void writngCode(String number, int index) {
    setState(() {
      code[index] = number;
      print(code);
    });
  }

  Future<void> createNewUser() async {
    UserCollectionHandler handler =
        UserCollectionHandler(widget.clientData['Phone']);
    while (check == null)
      check = await handler.createNewUser(widget.clientData);
    op = User(
      widget.clientData['Name'],
      widget.clientData['Phone'],
      widget.clientData['Balance'],
    );
  }

  Future<void> createNewDriver() async {
    DriverCollectionHandler handler = DriverCollectionHandler(
      widget.clientData['Phone'],
    );
    while (check == null)
      check = await handler.createNewDriver(widget.clientData);
    op = Driver(
      widget.clientData['Name'],
      widget.clientData['Phone'],
      widget.clientData['Balance'],
      widget.clientData['Image'],
    );
  }

  Future<void> getUser() async {
    while (userHandler == null) {
      userHandler = await UserCollectionHandler(
        widget.clientData['Phone'],
      ).getUserData();
      if (userHandler.isNotEmpty)
        op = op = User(
          userHandler['Name'],
          userHandler['Phone'],
          userHandler['Balance'],
        );
    }
  }

  Future<void> getDriver() async {
    while (userHandler == null)
      userHandler = await DriverCollectionHandler(
        widget.clientData['Phone'],
      ).getDriverData();
    if (userHandler.isNotEmpty)
      op = Driver(
        userHandler['Name'],
        userHandler['Phone'],
        userHandler['Balance'],
        userHandler['Image'],
      );
  }

  @override
  Widget build(BuildContext context) {
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
                      text: '\n01032153433',
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
                  Text('2:00'),
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
                    //===================== holders
                    String vCode = '';
                    //===================== acts
                    showDialog(
                      context: context,
                      builder: (context) => loadinDialog,
                    );
                    for (var s in code) vCode += s;
                    //===================== process
                    while (check == null) {
                      check = await widget.auther.verifySMS(vCode);
                    }
                    if (check) {
                      check = null;
                      if (widget.clientData["Price"] == null) {
                        await createNewUser();
                      } else if (widget.clientData.isEmpty) {
                        await getUser();
                        if (userHandler.isEmpty) {
                          userHandler = null;
                          await getDriver();
                        }
                        check = true;
                      } else {
                        await createNewDriver();
                      }
                      Navigator.pop(context);
                      if (check && op != null) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserHomeScreen(
                              user: op,
                            ),
                          ),
                          (route) => false,
                        );
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          6,
          (index) => SizedBox(
            width: 40,
            child: TextFormField(
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
              ),
              onChanged: (str) {
                onChange(str, index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
