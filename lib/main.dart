import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graby/Layout/Screens/DriverScreen/DriverHomeScreen.dart';
import 'package:graby/Layout/Screens/UserScreens/GoogleMapScreen.dart';
import 'Layout/Screens/AuthScreens/Log in Screen.dart';
import 'Layout/Screens/AuthScreens/Register Screen.dart';
import 'Layout/Screens/CommonScreens/Splash Screen.dart';
import 'Layout/Screens/DriverScreen/DriverProfileScreen.dart';
import 'Layout/Screens/UserScreens/ChargingScreen.dart';
import 'Layout/Screens/UserScreens/HistoryTripsScreen.dart';
import 'Layout/Screens/UserScreens/PointsScreen.dart';
import 'Layout/Screens/UserScreens/Transfer Screen.dart';
import 'Layout/Screens/UserScreens/UserHomeScreen.dart';
import 'Layout/Screens/UserScreens/UserProfileScreen.dart';

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
        'SplashScreen': (context) => SplashScreen(),
        'LoginScreen': (context) => LoginScreen(),
        'RegisterScreen': (context) => RegisterScreen(),
        'UserHomeScreen': (context) => UserHomeScreen(),
        'UserProfieScreen': (context) => UserProfileScreen(),
        'HistoryScreen': (context) => HistroyTripsScreen(),
        'PointsScreen': (context) => PointsScreen(),
        "ChargingScreen": (context) => ChargingScreen(),
        'MapScreen': (context) => MapScreen(),
        'TransferScreen': (context) => TransferScreen(),
        'DriverHomeScreen': (context) => DriverHomeScreen(),
        'DriverProfileScreen': (context) => DriverProfileScreen(),
      },
      initialRoute: 'SplashScreen',
    );
  }
}
