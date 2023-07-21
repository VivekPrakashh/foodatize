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
}

final homebloc = HomeBloc();
