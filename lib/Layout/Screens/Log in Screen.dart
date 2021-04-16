import 'package:flutter/material.dart';
import 'package:graby/Data/DataBase/FireBase%20Auther.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:graby/Layout/Widgets/AppField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                InputField(
                  label: 'رقم الهاتف',
                  inputType: TextInputType.number,
                  onChanged: (String str) => setState(() => phone = str),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: SizedBox(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => loadinDialog,
                        );
                        PhoneAuther auth = PhoneAuther("+2$phone", context);
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
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, 'RegisterScreen'),
                        child: Text(
                          'إنشاء حساب',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Text(
                      'لا تمتلك حساب ؟',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
