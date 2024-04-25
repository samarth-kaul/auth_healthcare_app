import 'package:auth_healthcare_app/Repository/auth_repository.dart';
import 'package:auth_healthcare_app/Utilities/Routes/route_names.dart';
import 'package:auth_healthcare_app/View/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel {
  static Future<void> loginApi(dynamic data, BuildContext context) async {
    AuthRepository.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
      Navigator.pushReplacementNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  static Future<void> registerApi(dynamic data, BuildContext context) async {
    AuthRepository.registerApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
      Navigator.pushReplacementNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
