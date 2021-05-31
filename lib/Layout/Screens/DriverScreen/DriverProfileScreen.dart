import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graby/Data/Models/Driver.dart';
import 'package:graby/Layout/Tools/CollectionOfSittingOptions.dart';
import 'package:graby/Layout/Widgets/App%20AppBar.dart';
import 'package:graby/Layout/Widgets/App%20NavigationBar.dart';
import 'package:graby/Layout/Widgets/App%20SittingOption.dart';

class DriverProfileScreen extends StatefulWidget {
  DriverProfileScreen({Key key}) : super(key: key);

  @override
  _DriverProfileScreenState createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> with SittingOptions {
  @override
  Widget build(BuildContext context) {
    final Driver driver = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar,
      //=============================================
      //=============================================
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        color: Color(0xffefefef),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                driver.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: sittingOptionsElements(true)
                    .entries
                    .map(
                      (option) => SittingOption(title: option.key, iconPath: option.value, onTap: sittingOptionsFunctions(context)[option.key], value: (option.key == "محفظتك") ? driver.balance : null),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      //=============================================
      //=============================================
      bottomNavigationBar: DriverHomeNavigationBar(
        parentContext: context,
        index: 0,
        arguments: driver,
      ),
    );
  }
}
