import 'package:dio/dio.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';

class BeerRemoteService implements BeerService {
  final String _baseUrl = "https://icapps-nodejs-beers-api.herokuapp.com/api/v1/";
  final Dio client;

  BeerRemoteService(this.client);

  @override
  Future<BaseResponseJsonDto<BeerJsonDto>?> rateBeer(String beerId) async {
    final response = await client.put<BaseResponseJsonDto<BeerJsonDto>>("$_baseUrl/beers/$beerId");
    return response.data;
  }

  @override
  Future<BaseResponseJsonDto<List<BeerJsonDto>>?> getBeers() async {
    final response = await client.get<BaseResponseJsonDto<List<BeerJsonDto>>>("$_baseUrl/breweries");
    return response.data;
  }

  @override
  Future<BaseResponseJsonDto<List<BreweryJsonDto>>?> getBreweries() async {
    final response = await client.get<BaseResponseJsonDto<List<BreweryJsonDto>>>("$_baseUrl/beers");
    return response.data;
  }
}
