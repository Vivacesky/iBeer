import 'package:flutter/widgets.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';

class HomeViewModel extends ChangeNotifier {
  final CachedBeerRepository cachedBeerRepository;

  //state
  late bool _loading;
  BaseResponseViewModel<List<BeerViewModel>>? _baseResponseViewModel;
  Object? exception;

  //getters
  bool get isLoading => _loading;

  List<BeerViewModel>? get beers => _baseResponseViewModel?.data;

  MetaViewModel? get meta => _baseResponseViewModel?.meta;

  HomeViewModel(this.cachedBeerRepository) {
    _loading = true;
    _baseResponseViewModel = null;
    getBeers();
  }

  //setters
  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void setResponse(BaseResponseViewModel<List<BeerViewModel>> response) {
    _baseResponseViewModel = response;
    if (exception != null) exception = null;
    notifyListeners();
  }

  void setException(Object object) {
    exception = object;
    notifyListeners();
  }

  //api
  void getBeers() async {
    setLoading(true);
    var response = await cachedBeerRepository.getBeers();
    response.fold(
      (l) => setException(l),
      (r) => setResponse(r),
    );
    setLoading(false);
  }
}
