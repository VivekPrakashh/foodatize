import 'dart:convert';
import 'package:foodatize/util/const.dart';
import 'package:http/http.dart' as http;

class Callapi {
  Future<dynamic> doLogin({
    String phone = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("$baseUrl/user/register-users"), body: {
        "phone_number": phone,
      });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 400) {
        return jsonDecode(response.body) as Map;
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }

  Future<dynamic> checkLoginOtp({
    String otp = "",
    String phone = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("$baseUrl/user/otp-verification"), body: {
        "phone_number": phone,
        "phone_otp": otp,
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else if (response.statusCode == 400) {
        print(response.body);

        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Something went wrong";
      }
    } catch (e) {
      print(e);
      throw "Something went wrong";
    } finally {
      client.close();
    }
  }

  Future<dynamic> saveinfo({
    String name = "",
    String email = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.put(Uri.parse("$baseUrl/user/save-basic-info/5"), body: {
        "name": name,
        "email": email,
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body) as Map;
      } else if (response.statusCode == 400) {
        print(response.body);

        return jsonDecode(response.body) as Map;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw "Something went wrong";
      }
    } catch (e) {
      print(e);
      throw "Something went wrong";
    } finally {
      client.close();
    }
  }
}
