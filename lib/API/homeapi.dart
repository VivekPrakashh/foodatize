import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../util/const.dart';
import '../util/userCred.dart';



class HomeApi{
   var client = http.Client();
    Future<dynamic> fetchHomeProduct() async {
    try {
      final response = await client.get(Uri.parse("$baseUrl/product"));
      if (response.statusCode == 200) {
       // log(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

 Future<dynamic> searchProduct(s) async {
    try {
      final body = {'name': '$s'};
      final response = await client.post(Uri.parse("$baseUrl/product/search"),
          body: jsonEncode(body),
          headers: {'content-type': 'application/json'});
      if (response.statusCode == 200) {
        log(response.body);
        return response;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // // print(e);
    } finally {}
  }

Future<dynamic> fetchCart(
  {
    String product_id="",
     String user_id="",

  }
) async {
    try {
      final response = await client.post(
        Uri.parse("$baseUrl/add-to-cart/5"),
        body: {
          "product_id":product_id,
          "user_id":user_id
        }
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return response;
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(msg: "Internal server error");
        return;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }
}

