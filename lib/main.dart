import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graby/Layout/Screens/HistoryTripsScreen.dart';
import 'package:graby/Layout/Screens/Splash%20Screen.dart';
import 'package:graby/Layout/Screens/Verfication%20Screen.dart';
import 'Layout/Screens/AccountSittingsScreen.dart';
import 'Layout/Screens/ChargingScreen.dart';
import 'Layout/Screens/DriverHomeScreen.dart';
import 'Layout/Screens/PointsScreen.dart';
import 'Layout/Screens/TestScreen.dart';
import 'Layout/Screens/UserHomeScreen.dart';
import 'Layout/Screens/Log in Screen.dart';
import 'Layout/Screens/Register Screen.dart';
import 'Layout/Screens/Transfer Screen.dart';
import 'Layout/Screens/UserProfileScreen.dart';
import 'Layout/Screens/UserProfileScreen.dart';
import 'Layout/Screens/Verfication Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontFamily: 'Cairo'),
        ),
      ),
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        'RegisterScreen': (context) => RegisterScreen(),
        'SplashScreen': (context) => SplashScreen(),
        'HistoryScreen': (context) => HistroyTripsScreen(),
        'UserProfieScreen': (context) => UserProfileScreen(),
        'UserHomeScreen': (context) => UserHomeScreen(),
        'PointsScreen': (context) => PointsScreen(),
      },
      home: RegisterScreen(),
    );
  }
}
