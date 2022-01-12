import 'package:flutter/widgets.dart';
import 'package:i_beer/model/model.dart';

class DetailViewModel extends ChangeNotifier {
  final CachedBeerRepository cachedBeerRepository;

  DetailViewModel(
    this.cachedBeerRepository,
    this._beerViewModel,
  ) {
    _loading = false;
  }

  //state
  late bool _loading;
  BeerViewModel _beerViewModel;
  Object? exception;

  //getters
  bool get isLoading => _loading;

  BeerViewModel get beerViewModel => _beerViewModel;

  //setters
  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void setException(Object object) {
    exception = object;
    notifyListeners();
  }

  void setResponse(BeerViewModel beerViewModel) {
    _beerViewModel = _beerViewModel.copyWith(rating: beerViewModel.rating);
    notifyListeners();
  }

  //api
  void rateBeer(int rating) async {
    setLoading(true);
    var response = await cachedBeerRepository.rateBeer(_beerViewModel.id, rating);
    response.fold(
      (l) => setException(l),
      (r) => setResponse(r.data),
    );
    setLoading(false);
  }
}
