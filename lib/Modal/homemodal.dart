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
  String? status;
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
    status = (fp)['status'] ?? "";
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

class MainCartModal{
  
}
