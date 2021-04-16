import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/DataBase/FireBase%20Auther.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:graby/Layout/Widgets/AppField.dart';
import 'package:sliding_switch/sliding_switch.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool check = false;
  String name, phone, image, state = 'user';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('final.png'),
                    ),
                  ),
                ),
                SlidingSwitch(
                  value: check,
                  onChanged: (bool value) => setState(() {
                    check = value;
                    (value) ? state = 'driver' : state = 'user';
                  }),
                  textOff: 'الراكب',
                  textOn: 'السائق',
                  colorOff: Colors.blue,
                  colorOn: Colors.blue,
                  inactiveColor: Colors.white,
                  background: Colors.blue,
                ),
                (check)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          children: [
                            Card(
                              shape: CircleBorder(),
                              child: SizedBox(
                                width: 90,
                                height: 90,
                                child: Icon(CupertinoIcons.camera_fill,
                                    size: 50, color: Colors.grey),
                              ),
                              elevation: 10,
                            ),
                            Text(
                              'تعيين صورة شخصيه',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                      ),
                InputField(
                  label: 'أدخال الاسم كامل',
                  inputType: TextInputType.text,
                  onChanged: (String str) => setState(() => name = str),
                ),
                InputField(
                  label: 'رقم الهاتف',
                  inputType: TextInputType.phone,
                  onChanged: (String str) => setState(() => phone = str),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 80,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => loadinDialog,
                        );
                        PhoneAuther auth = PhoneAuther("+2$phone", context);
                        Map<String, dynamic> data;
                        (image == null)
                            ? data = {
                                'Name': name,
                                "Phone": "+2$phone",
                                'Balance': 0,
                              }
                            : data = {
                                'Name': name,
                                'Phone': "+2$phone",
                                'Image': image,
                                'Balance': 0,
                                'Price': 2,
                              };
                        auth.setData(name, data);
                        await auth.signInNumber();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'أنشاء حساب',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'تمتلك حساب بالفعل ؟',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
