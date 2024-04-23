import 'package:auth_healthcare_app/Utilities/Routes/route_names.dart';
import 'package:auth_healthcare_app/View/Auth/login_screen.dart';
import 'package:auth_healthcare_app/View/Auth/register_screen.dart';
import 'package:auth_healthcare_app/View/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RouteNames.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
