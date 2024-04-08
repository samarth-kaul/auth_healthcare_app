import 'package:auth_healthcare_app/screens/home_screen.dart';
import 'package:auth_healthcare_app/screens/login_screen.dart';
import 'package:auth_healthcare_app/screens/onboarding_screen1.dart';
import 'package:auth_healthcare_app/screens/onboarding_screen2.dart';
import 'package:auth_healthcare_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff147B72),
      ),
      home: SplashScreen(),
    );
  }
}
