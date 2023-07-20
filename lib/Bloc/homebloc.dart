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
}

final homebloc = HomeBloc();
