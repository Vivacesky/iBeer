import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:i_beer/common/cache_service.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BeerRemoteService extends CacheService implements BeerService {
  final String _baseUrl = "https://icapps-nodejs-beers-api.herokuapp.com/api/v1/";
  final Dio client;
  final Connectivity connectivity;

  BeerRemoteService(
    this.client,
    SharedPreferences sharedPreferences,
    this.connectivity,
  ) : super(sharedPreferences);

  @override
  Future<BaseResponseJsonDto<BeerJsonDto>?> rateBeer(String beerId) async {
    if (await canRemote) {
      final response = await client.put("$_baseUrl/beers/$beerId");
      return response.data;
    }
    //not supported offline
    throw NetworkException();
  }

  @override
  Future<BaseResponseJsonDto<List<BeerJsonDto>>?> getBeers() async {
    late Map<String, dynamic> json;
    if (await canRemote) {
      final response = await client.get("$_baseUrl/beers");
      await setString("beers", response.data.toString());
      json = response.data;
    } else {
      final cache = getString("beers");
      if (cache == null) {
        throw NetworkException();
      }
      json = jsonDecode(cache);
    }
    return BaseResponseJsonDto.fromJson(
      json,
      (beers) {
        return (beers as List<dynamic>).map((e) => BeerJsonDto.fromJson(e)).toList();
      },
    );
  }

  @override
  Future<BaseResponseJsonDto<List<BreweryJsonDto>>?> getBreweries() async {
    if (await canRemote) {
      final response = await client.get("$_baseUrl/breweries");
      await setString("breweries", response.data.toString());
      return response.data;
    } else {
      final cache = getString("breweries");
      if (cache == null) {
        throw NetworkException();
      }
      return BaseResponseJsonDto.fromJson(
        jsonDecode(cache),
        (breweries) {
          return (breweries as List<dynamic>).map((e) => BreweryJsonDto.fromJson(e)).toList();
        },
      );
    }
  }

  Future<bool> get canRemote async {
    final network = await connectivity.checkConnectivity();
    if (network != ConnectivityResult.mobile && network != ConnectivityResult.wifi) {
      return false;
    }
    return true;
  }
}
