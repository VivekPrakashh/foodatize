import 'dart:convert';

import 'package:foodatize/Modal/homemodal.dart';

import '../API/homeapi.dart';

class HomeRepo {
  HomeApi homeApi = HomeApi();
  Future<Product> fetchProduct() async {
    final response = await homeApi.fetchHomeProduct();
    var jsonResponse = jsonDecode(response.body) as Map;
    return Product(jsonResponse);
  }
}
