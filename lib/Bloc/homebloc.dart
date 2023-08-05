import 'package:foodatize/Modal/homemodal.dart';
import 'package:rxdart/rxdart.dart';
import '../Repo/homerepo.dart';

class HomeBloc {
  final HomeRepo _homeRepo = HomeRepo();
  final BehaviorSubject<Product> _liveproduct = BehaviorSubject<Product>();
  BehaviorSubject<Product> get getProduct => _liveproduct;
  fetchproduct() async {
    try {
      Product product = await _homeRepo.fetchProduct();
      // print(homeSlider.imgs!.length);

      _liveproduct.add(product);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<SearchModal> _liveSearch =
      BehaviorSubject<SearchModal>();
  BehaviorSubject<SearchModal> get getSearchProduct => _liveSearch;
  searchProduct(s) async {
    try {
      SearchModal homeSlider = await _homeRepo.searchProduct(s);
      // print(homeSlider.imgs!.length);

      _liveSearch.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<GetcartModel> getCart = BehaviorSubject<GetcartModel>();
  BehaviorSubject<GetcartModel> get getTooCart => getCart;
  getToCart() async {
    try {
      GetcartModel homeSlider = await _homeRepo.getToCart();
      // print(homeSlider.imgs!.length);

      getCart.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<GetAddressModal> getAddress =
      BehaviorSubject<GetAddressModal>();
  BehaviorSubject<GetAddressModal> get getsAddress => getAddress;
  getaddress() async {
    try {
      GetAddressModal homeSlider = await _homeRepo.getaddress();
      // print(homeSlider.imgs!.length);

      getAddress.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

  final BehaviorSubject<CheckoutModal> checkout =
      BehaviorSubject<CheckoutModal>();
  BehaviorSubject<CheckoutModal> get getcheckout => checkout;
  checkOut(id) async {
    try {
      CheckoutModal homeSlider = await _homeRepo.checkOut(id);
      // print(homeSlider.imgs!.length);

      checkout.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

   final BehaviorSubject<OrderHistoryModal> orderhistory =
      BehaviorSubject<OrderHistoryModal>();
  BehaviorSubject<OrderHistoryModal> get getOrderHistory => orderhistory;
  orderHistory() async {
    try {
      OrderHistoryModal homeSlider = await _homeRepo.orderHistory();
      // print(homeSlider.imgs!.length);

      orderhistory.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }

   final BehaviorSubject<OrderDetailModal> orderdetail =
      BehaviorSubject<OrderDetailModal>();
  BehaviorSubject<OrderDetailModal> get getDetail => orderdetail;
  getOrderDetail(id) async {
    try {
      OrderDetailModal homeSlider = await _homeRepo.getOrderDetail(id);
      // print(homeSlider.imgs!.length);

      orderdetail.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }


   final BehaviorSubject<UserDetailModal> userdetail =
      BehaviorSubject<UserDetailModal>();
  BehaviorSubject<UserDetailModal> get getUserDetail => userdetail;
  userDetail() async {
    try {
      UserDetailModal homeSlider = await _homeRepo.userDetail();
      // print(homeSlider.imgs!.length);

      userdetail.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }


   final BehaviorSubject<UpdateDetailModal> updatedetail =
      BehaviorSubject<UpdateDetailModal>();
  BehaviorSubject<UpdateDetailModal> get getUpdateDetail => updatedetail;
  updateDetail() async {
    try {
      UpdateDetailModal homeSlider = await _homeRepo.updateDetail();
      // print(homeSlider.imgs!.length);

      updatedetail.add(homeSlider);
    } catch (e) {
      print(e);
    }
  }
}

final homebloc = HomeBloc();
