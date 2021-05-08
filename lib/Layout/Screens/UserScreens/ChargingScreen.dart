import 'package:flutter/material.dart';
import 'package:graby/Data/Models/User.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20ConfirmationButton.dart';
import 'package:graby/Layout/Widgets/App%20Dialogs.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Widgets/AppField.dart';

class ChargingScreen extends StatefulWidget {
  ChargingScreen({Key key}) : super(key: key);

  @override
  _ChargingScreenState createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context).settings.arguments;
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
              bottom: -70,
              child: Opacity(
                opacity: .3,
                child: Container(
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("Images/Wallet-amico.png"),
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
                      "إشحن محفظتك",
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
                    label: 'رقم الكارت',
                    onChanged: (value) {},
                  ),
                  ConfirmationButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => newTrip(context, 2000),
                      );
                    },
                    text: 'إشحن',
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
        index: 2,
        arguments: user,
      ),
    );
  }
}
