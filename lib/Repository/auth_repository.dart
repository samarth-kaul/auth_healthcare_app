import 'package:auth_healthcare_app/Data/Network/api_services.dart';
import 'package:auth_healthcare_app/Resources/AppUrls/app_urls.dart';

class AuthRepository {
  // calling the login api
  static Future<dynamic> loginApi(dynamic data) async {
    try {
      var response = await ApiServices().postApi(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // calling the register api
  static Future<dynamic> registerApi(dynamic data) async {
    try {
      var response = await ApiServices().postApi(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
