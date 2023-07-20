import 'dart:developer';

import 'package:http/http.dart' as http;

import '../util/const.dart';



class HomeApi{
   var client = http.Client();
    Future<dynamic> fetchHomeProduct() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/product"));
      if (response.statusCode == 200) {
        log(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}