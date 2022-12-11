import 'package:bmi_app/pages/calculate/bmi/bmi_home.dart';
import 'package:bmi_app/pages/calculate/bmr/bmr_home.dart';
import 'package:bmi_app/pages/calculate/calculate_list.dart';
import 'package:bmi_app/pages/calculate/rhr/rhr_home.dart';
import 'package:bmi_app/pages/onboarding.dart';
import 'package:bmi_app/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'splash': (context) => SplashScreen(),
        'calculate': (context) => CalculateList(),
        'bmi': (context) => BmiPage(),
        'bmr': (context) => BmrPage(),
        'rhr': (context) => RhrPage(),
      },
      theme: ThemeData(
        fontFamily: 'SFRounded',
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.black.withOpacity(0.75),
          displayColor: Colors.black.withOpacity(0.75),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingPages(),
    );
  }
}
