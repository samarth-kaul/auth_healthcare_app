import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'base_api_services.dart';

class ApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    var jsonData;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    } catch (e) {
      throw ("Unknown Error Occured..");
    }
    return jsonData;
  }

  @override
  Future postApi(String url, dynamic data) async {
    var jsonData;
    try {
      var response = await http
          .post(
            Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Charset': 'utf-8'
            },
            body: jsonEncode(data),
          )
          .timeout(
            const Duration(seconds: 10),
          );
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }
    return jsonData;
  }

  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = response.body;
        return jsonResponse;
      case 400:
        var jsonResponse = response.body;
        return jsonResponse;
      case 404:
        throw ServerError(response.body.toString());
      default:
        throw FetchDataException(
            'Error while Communication: ${response.statusCode}');
    }
  }
}
