import 'package:auth_healthcare_app/Utilities/Routes/route_names.dart';
import 'package:auth_healthcare_app/Utilities/Routes/routes.dart';
import 'package:auth_healthcare_app/View/best_docs_screen.dart';
import 'package:auth_healthcare_app/View/doc_screen.dart';
import 'package:auth_healthcare_app/View/home_screen.dart';
import 'package:auth_healthcare_app/View/Auth/login_screen.dart';
import 'package:auth_healthcare_app/View/Splash/onboarding_screen1.dart';
import 'package:auth_healthcare_app/View/Splash/onboarding_screen2.dart';
import 'package:auth_healthcare_app/View/Splash/splash_screen.dart';
import 'package:auth_healthcare_app/View/user_profile_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff147B72),
        ),
      ),
      initialRoute: RouteNames.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
