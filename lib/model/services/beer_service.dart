import 'package:i_beer/common/dtos/base_response_json_dto.dart';
import 'package:i_beer/model/model.dart';

abstract class BeerService {
  /// GET beers
  Future<BaseResponseJsonDto<List<BeerJsonDto>>?> getBeers();

  /// GET breweries
  Future<BaseResponseJsonDto<List<BreweryJsonDto>>?> getBreweries();

  /// PUT rate beer
  Future<BaseResponseJsonDto<BeerJsonDto>?> rateBeer(String beerId);
}
