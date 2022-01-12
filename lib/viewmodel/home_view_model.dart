import 'package:flutter/widgets.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';

class HomeViewModel extends ChangeNotifier {
  final CachedBeerRepository cachedBeerRepository;

  //state
  late bool _loading;
  BaseResponseViewModel<List<BeerViewModel>>? _baseResponseViewModel;
  Object? exception;
  bool _onlyRated = false;
  List<BeerViewModel> _beers = [];

  //getters
  bool get isLoading => _loading;

  List<BeerViewModel>? get beers => _beers;

  List<BeerViewModel>? get row1 => beers?.getRange(0, (beers?.length ?? 0) ~/ 2).toList();

  List<BeerViewModel>? get row2 => beers?.getRange((beers?.length ?? 0) ~/ 2, beers?.length ?? 0).toList();

  MetaViewModel? get meta => _baseResponseViewModel?.meta;

  bool get onlyRated => _onlyRated;

  HomeViewModel(this.cachedBeerRepository) {
    _loading = true;
    _baseResponseViewModel = null;
    getBeers();
  }

  //setters
  void setRated(bool onlyRated) {
    _onlyRated = onlyRated;
    _beers = (_baseResponseViewModel?.data ?? []).where(
      (b) {
        if (_onlyRated && b.rating == null) {
          return false;
        }
        return true;
      },
    ).toList();
    notifyListeners();
  }

  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void setResponse(BaseResponseViewModel<List<BeerViewModel>> response) {
    _baseResponseViewModel = response;
    if (exception != null) exception = null;
    _beers = _baseResponseViewModel?.data ?? [];
    _onlyRated = false;
    notifyListeners();
  }

  void setException(Object object) {
    exception = object;
    notifyListeners();
  }

  void searchBeers(String value) {
    _beers = (_baseResponseViewModel?.data ?? [])
        .where(
          (b) {
            if (_onlyRated && b.rating == null) {
              return false;
            }
            return true;
          },
        )
        .where((element) => element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
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
