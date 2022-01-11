import 'dart:convert';

import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BeerLocalService implements BeerService {
  //TODO use hive istead of SharedPreferences
  final SharedPreferences sharedPreferences;

  BeerLocalService(this.sharedPreferences);

  @override
  Future<BaseResponseJsonDto<BeerJsonDto>?> rateBeer(String beerId) {
    // TODO: implement getBeerPackage
    throw UnimplementedError();
  }

  @override
  Future<BaseResponseJsonDto<List<BeerJsonDto>>?> getBeers() {
    final json = sharedPreferences.getString("beers");
    if (json != null) {
      return Future.value(
        BaseResponseJsonDto.fromJson(
          jsonDecode(json),
          (beers) {
            return (beers as List<dynamic>).map((e) => BeerJsonDto.fromJson(e)).toList();
          },
        ),
      );
    }
    return Future.value(null);
  }

  @override
  Future<BaseResponseJsonDto<List<BreweryJsonDto>>?> getBreweries() {
    final json = sharedPreferences.getString("breweries");
    if (json != null) {
      return Future.value(
        BaseResponseJsonDto.fromJson(
          jsonDecode(json),
          (breweries) {
            return (breweries as List<dynamic>).map((e) => BreweryJsonDto.fromJson(e)).toList();
          },
        ),
      );
    }
    return Future.value(null);
  }
}
