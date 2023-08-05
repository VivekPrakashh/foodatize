import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../util/const.dart';
import '../util/userCred.dart';

class HomeApi {
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

  Future<dynamic> addtoCart({
    String product_id = "",
    String user_id = "",
  }) async {
    try {
      print("$baseUrl/add-to-cart/${userCred.getUserId()}");
      final response = await client.post(
          Uri.parse("$baseUrl/add-to-cart/${userCred.getUserId()}"),
          body: {"product_id": product_id, "mode": "add"});
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> substractToCart({
    String product_id = "",
    String user_id = "",
    String mode = "",
  }) async {
    try {
      final response = await client.post(
          Uri.parse("$baseUrl/add-to-cart/${userCred.getUserId()}"),
          body: {
            "mode": mode,
            "product_id": product_id,
            "user_id": userCred.getUserId()
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> getToCart() async {
    print(userCred.getUserId());
    try {
      final response = await client.get(
        Uri.parse("$baseUrl/get-user-cart-info/${userCred.getUserId()}"),
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

  Future<dynamic> deleteToCart(id) async {
    try {
      print(id);
      final response = await client.delete(
        Uri.parse("$baseUrl/remove-from-cart/$id"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> addAddress({
    String user_id = "",
    String longitude = "",
    String latitude = "",
    String full_address = "",
    String landmark = "",
    int pincode = 0,
    String recieving_person = "",
    String km = "",
    String recieving_person_mobile_number = "",
  }) async {
    var client = http.Client();
    try {
      final response =
          await client.post(Uri.parse("$baseUrl/address/store"), body: {
        "user_id": userCred.getUserId(),
        "longitude": longitude,
        "latitude": latitude,
        "landmark": landmark,
        "km": km,
        "full_address": full_address,
        "recieving_person": recieving_person,
        "pincode": pincode.toString(),
        "recieving_person_mobile_number": recieving_person_mobile_number,
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
    } finally {}
  }

  Future<dynamic> getaddress() async {
    try {
      final response = await client.get(
        Uri.parse("$baseUrl/address/get-user-address/${userCred.getUserId()}"),
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

  Future<dynamic> deleteAddress(id) async {
    try {
      final response = await client.delete(
        Uri.parse("$baseUrl/address/delete/$id"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return jsonDecode(response.body) as Map;
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

  Future<dynamic> updateAddress({
    int? id,
    String full_address = "",
    // int km = 0,
    String longitude = "",
    String latitude = "",
    int pincode = 0,
    String recieving_person = "",
    String recieving_person_mobile_number = "",
    String landmark = "",
  }) async {
    try {
      final response =
          await client.post(Uri.parse("$baseUrl/address/update/$id"), body: {
        "full_address": full_address,
        "_method": "PUT",
        "longitude": longitude,
        "latitude": latitude,
        "pincode": "$pincode",
        "recieving_person": recieving_person,
        "recieving_person_mobile_number": recieving_person_mobile_number,
        "landmark": landmark,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(msg: "Internal server error");
        return;
      } else {
        print(response.body);
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> checkOut({
    int address_id = 0,
  }) async {
    try {
      final response = await client.post(Uri.parse("$baseUrl/checkout"), body: {
        "user_id": userCred.getUserId(),
        "address_id": address_id.toString(),
      });
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

  Future<dynamic> selectPayment(id) async {
    print(id);
    try {
      final response = await client
          .post(Uri.parse("$baseUrl/select-payment-method/$id"), body: {
        "_method": "PUT",
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(msg: "Internal server error");
        return;
      } else {
        log(response.body);
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<dynamic> orderHistory() async {
    try {
      final response = await client.get(
        Uri.parse("$baseUrl/get-order-history/${userCred.getUserId()}"),
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

  Future<dynamic> getOrderDetail(id) async {
    try {
      final response = await client.get(
        Uri.parse("$baseUrl/get-order-detail/$id"),
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

  Future<dynamic> userDetail() async {
    try {
      final response = await client.get(
        Uri.parse("$baseUrl/user/detail/${userCred.getUserId()}"),
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

  Future<dynamic> updateDetail({
    String name = "",
    String phone_number = "",
    String email = "",
    String phone_number_old = "",
  }) async {
    try {
      final response = await client.put(
          Uri.parse("$baseUrl/user/update/${userCred.getUserId()}"),
          body: {
            "name": name,
            "phone_number": phone_number,
            "email": email,
            "phone_number_old": phone_number_old,
            "_method": "PUT",
          });
      if (response.statusCode == 200 || response.statusCode == 202) {
        log(response.body);
        return jsonDecode(response.body) as Map;
      } else if (response.statusCode == 500) {
        Fluttertoast.showToast(msg: "Internal server error");
        return;
      } else {
        print(response.body);
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {}
  }


  
}
