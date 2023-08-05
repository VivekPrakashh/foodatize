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

  Future<SearchModal> searchProduct(s) async {
    final response = await homeApi.searchProduct(s);
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return SearchModal(jsonResponse);
  }

   Future<GetcartModel> getToCart() async {
    final response = await homeApi.getToCart();
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return GetcartModel(jsonResponse);
  }

   Future<GetAddressModal> getaddress() async {
    final response = await homeApi.getaddress();
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return GetAddressModal(jsonResponse);
  }


  Future<CheckoutModal> checkOut(id) async {
    final response = await homeApi.checkOut(address_id: id);
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return CheckoutModal(jsonResponse);
  }


  Future<OrderHistoryModal> orderHistory() async {
    final response = await homeApi.orderHistory();
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return OrderHistoryModal(jsonResponse);
  }


   Future<OrderDetailModal> getOrderDetail(id) async {
    final response = await homeApi.getOrderDetail(id);
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return OrderDetailModal(jsonResponse);
  }


Future<UserDetailModal> userDetail() async {
    final response = await homeApi.userDetail();
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return UserDetailModal(jsonResponse);
  }


  Future<UpdateDetailModal> updateDetail() async {
    final response = await homeApi.updateDetail();
    var jsonResponse = jsonDecode(response.body) as Map;
    
    return UpdateDetailModal(jsonResponse);
  }

  
}
