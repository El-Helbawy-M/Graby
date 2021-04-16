import 'package:flutter/material.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20ConfirmationButton.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Widgets/AppField.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({Key key}) : super(key: key);

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //==========================================
      //==========================================
      appBar: appBar,
      //==========================================
      //==========================================
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xfff5f5f5),
            ),
            Positioned(
              bottom: 0,
              child: Opacity(
                opacity: .3,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    width: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("Images/Cash Payment-bro.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "تحويل الفلوس",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  InputField(
                    inputType: TextInputType.number,
                    label: 'رقم الهاتف',
                    onChanged: (value) {},
                  ),
                  InputField(
                    inputType: TextInputType.number,
                    label: 'المبلغ',
                    onChanged: (value) {},
                  ),
                  InputField(
                    inputType: TextInputType.number,
                    label: 'الرقم السري',
                    onChanged: (value) {},
                  ),
                  ConfirmationButton(
                    onPressed: () {},
                    text: 'حول',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //==========================================
      //==========================================
      bottomNavigationBar: UserHomeNavigationBar(
        parentContext: context,
      ),
    );
  }
}
