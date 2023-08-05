class Product {
  List<FoodProduct> newlist = [];
  Product(fp) {
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(FoodProduct(fp['data'][i]));
    }
  }
}

class FoodProduct {
  int? id;
  String? name;
  String? image;
  String? pieces;
  int? price;
  int? quantity;
  String? description;
  dynamic status;
  String? created_at;
  String? updated_at;

  FoodProduct(fp) {
    id = (fp)['id'] ?? 0;
    name = (fp)['name'] ?? "";
    image = (fp)['image'] ?? "";
    pieces = (fp)['pieces'] ?? 0;
    price = (fp)['price'] ?? 0;
    quantity = (fp)['quantity'] ?? 0;
    description = (fp)['description'] ?? "";
    status = (fp)['status'] ?? 0;
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
  }
}

class SearchModal {
  List<SearchDetailModal> newlist = [];
  SearchModal(fp) {
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(SearchDetailModal(fp['data'][i]));
    }
  }
}

class SearchDetailModal {
  int? id;
  String? name;
  String? image;
  String? pieces;
  int? price;
  int? quantity;
  String? description;
  String? status;
  String? created_at;
  String? updated_at;

  SearchDetailModal(fp) {
    id = (fp)['id'] ?? 0;
    name = (fp)['name'] ?? "";
    image = (fp)['image'] ?? "";
    pieces = (fp)['pieces'] ?? "";
    price = (fp)['price'] ?? 0;
    quantity = (fp)['quantity'] ?? 0;
    description = (fp)['description'] ?? "";
    status = (fp)['status'] ?? "";
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
  }
}

class GetcartModel {
  List<CartModal> newlist = [];
  dynamic amount;
  GetcartModel(fp) {
    amount = fp['total_cart_amount'] ?? "0";
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(CartModal(fp['data'][i]));
    }
  }
}

class CartModal {
  int? id;
  String? name;
  String? pieces;
  String? image;
  int? user_id;
  int? product_id;
  int? price;
  int? quantity;
  dynamic status;
  String? created_at;
  String? updated_at;
  CartModal(fp) {
    id = (fp)['id'] ?? 0;
    name = (fp)['name'] ?? "";
    pieces = (fp)['pieces'] ?? "";
    image = (fp)['image'] ?? "";
    user_id = (fp)['user_id'] ?? 0;
    product_id = (fp)['product_id'] ?? 0;
    price = (fp)['price'] ?? 0;
    quantity = (fp)['quantity'] ?? 0;
    status = (fp)['status'] ?? 0;
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
  }
}

class GetAddressModal {
  List<AddressModal> newlist = [];

  GetAddressModal(fp) {
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(AddressModal(fp['data'][i]));
    }
  }
}

class AddressModal {
  int? id;
  int? user_id;
  String? longitude;
  String? latitude;
  dynamic? km;
  String? full_address;
  String? landmark;
  int? pincode;
  String? recieving_person;
  String? recieving_person_mobile_number;
  String? created_at;
  String? updated_at;
  AddressModal(fp) {
    id = (fp)['id'] ?? 0;
    user_id = (fp)['user_id'] ?? 0;
    longitude = (fp)['longitude'] ?? "";
    latitude = (fp)['latitude'] ?? "";
    km = (fp)['km'] ?? 0;
    full_address = (fp)['full_address'] ?? "";
    landmark = (fp)['landmark'] ?? "";
    pincode = (fp)['pincode'] ?? 0;
    recieving_person = (fp)['recieving_person'] ?? 0;
    recieving_person_mobile_number =
        (fp)['recieving_person_mobile_number'] ?? 0;
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
  }
}

class CheckoutModal {
  int? status;
  String? message;
  CheckModal? data;
  CheckoutModal(fp) {
    message = (fp)['message'] ?? "";
    status = (fp)['status'] ?? 0;
    data = CheckModal(fp['data']);
  }
}

class CheckModal {
  dynamic? item_total;
  dynamic? gst;
  dynamic? gst_price;
  dynamic? km_price;
  dynamic? to_pay;
  dynamic? order_id;
  CheckModal(fp) {
    item_total = (fp)['item_total'] ?? "";
    gst = (fp)['gst'] ?? 0;
    gst_price = (fp)['gst_price'] ?? 0;
    km_price = (fp)['km_price'] ?? 0;
    to_pay = (fp)['to_pay'] ?? 0;
    order_id = (fp)['order_id'] ?? 0;
  }
}

class OrderHistoryModal {
  int? status;
  String? message;
  List<OrderModal> newlist = [];
  OrderHistoryModal(fp) {
    message = (fp)['message'] ?? "";
    status = (fp)['status'] ?? 0;
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(OrderModal(fp['data'][i]));
    }
  }
}

class OrderModal {
  int? id;
  dynamic order_number;
  dynamic item_count;

  String? status;
  int? address_id;
  dynamic gst;
  int? payment_status;
  dynamic payment_method;
  String? created_at;
  String? updated_at;
  dynamic order_time;
  dynamic transaction_number;
  dynamic final_amount;

  OrderModal(fp) {
    id = (fp)['id'] ?? 0;
    order_number = (fp)['order_number'] ?? "";
    item_count = (fp)['item_count'] ?? "";

    status = (fp)['status'] ?? "";
    address_id = (fp)['address_id'] ?? 0;
    gst = (fp)['gst'] ?? "";
    payment_method = (fp)['payment_method'] ?? 0;
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
    order_time = (fp)['order_time'] ?? "";
    transaction_number = (fp)['transaction_number'] ?? "";
    final_amount = (fp)['final_amount'] ?? "";
  }
}

class OrderDetailModal {
  int? status;
  String? message;
  List<DetailModal> newlist = [];
  OrderDetail? order_detail;
  OrderDetailModal(fp) {
    message = (fp)['message'] ?? "";
    status = (fp)['status'] ?? 0;
    for (var i = 0; i < fp['item'].length; i++) {
      newlist.add(DetailModal(fp['item'][i]));
    }
    order_detail = OrderDetail(fp['order_detail']);
  }
}

class DetailModal {
  int? id;
  int? user_id;
  int? product_id;
  dynamic price;
  int? quantity;
  int? status;
  String? created_at;
  String? updated_at;
  String? name;
  String? pieces;
  String? image;
  DetailModal(fp) {
    id = (fp)['id'] ?? 0;
    user_id = (fp)['user_id'] ?? 0;
    product_id = (fp)['product_id'] ?? 0;
    price = (fp)['price'] ?? "";
    quantity = (fp)['quantity'] ?? 0;
    status = (fp)['status'] ?? 0;
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
    name = (fp)['name'] ?? "";
    pieces = (fp)['pieces'] ?? "";
    image = (fp)['image'] ?? "";
  }
}

class OrderDetail {
  String? booking_id;
  dynamic total_item_price;
  dynamic km;
  dynamic km_price;
  dynamic gst;
  dynamic to_pay;
  int? payment_method;
  int? payment_status;
  OrderDetail(fp) {
    booking_id = (fp)['booking_id'] ?? "";
    total_item_price = (fp)['total_item_price'] ?? "";
    km = (fp)['km'] ?? "";
    km_price = (fp)['km_price'] ?? "";
    gst = (fp)['gst'] ?? "";
    to_pay = (fp)['to_pay'] ?? "";
    payment_method = (fp)['payment_method'] ?? 0;
    payment_status = (fp)['payment_status'] ?? 0;
  }
}

class UserDetailModal {
  int? status;
  String? message;
  List<UserModal> newlist = [];
  UserDetailModal(fp) {
    message = (fp)['message'] ?? "";
    status = (fp)['status'] ?? 0;
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(UserModal(fp['data'][i]));
    }
  }
}

class UserModal {
  int? id;
  String? name;
  String? phone_number;
  String? phone_otp;
  dynamic phone_otp_time;
  int? phone_status;
  String? email;
  String? email_otp;
  dynamic email_status;
  dynamic token;
  String? created_at;
  String? updated_at;

  UserModal(fp) {
    id = (fp)['id'] ?? 0;
    name = (fp)['name'] ?? "";
    phone_number = (fp)['phone_number'] ?? "";
    phone_otp = (fp)['phone_otp'] ?? "";
    phone_otp_time = (fp)['phone_otp_time'] ?? "";
    phone_status = (fp)['phone_status'] ?? 0;
    email = (fp)['email'] ?? "";
    email_otp = (fp)['email_otp'] ?? "";
    email_status = (fp)['email_status'] ?? "";
    token = (fp)['token'] ?? "";
    created_at = (fp)['created_at'] ?? "";
    updated_at = (fp)['updated_at'] ?? "";
  }
}

class UpdateDetailModal {
  int? status;
  String? message;
  List<UserDetail> newlist = [];
  UpdateDetailModal(fp) {
    message = (fp)['message'] ?? "";
    status = (fp)['status'] ?? 0;
    for (var i = 0; i < fp['data'].length; i++) {
      newlist.add(UserDetail(fp['data'][i]));
    }
  }
}

class UserDetail {
  String? name;
  String? phone_number;
  int? phone_otp;
  dynamic phone_otp_time;
  int? phone_status;
  UserDetail(fp) {
    name = (fp)['name'] ?? "";
    phone_number = (fp)['phone_number'] ?? "";
    phone_otp = (fp)['phone_otp'] ?? 0;
    phone_otp_time = (fp)['phone_otp_time'] ?? "";
    phone_status = (fp)['phone_status'] ?? 0;
  }
}
