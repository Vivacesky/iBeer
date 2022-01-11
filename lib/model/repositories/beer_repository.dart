import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';

abstract class BeerRepository {
  Future<Either<Object, BaseResponseViewModel<List<BeerViewModel>>>> getBeers();

  Future<Either<Object, BaseResponseViewModel<List<BreweryViewModel>>>> getBreweries();

  Future<Either<Object, BaseResponseViewModel<BeerViewModel>>> rateBeer(String beerId);
}

class CachedBeerRepository implements BeerRepository {
  final Connectivity connectivity;
  final BeerRemoteService beerRemoteService;
  final BeerLocalService beerLocalService;

  const CachedBeerRepository(this.connectivity, this.beerRemoteService, this.beerLocalService);

  // TODO check if connection
  // TODO save if succeed
  // TODO cache in sync houden

  @override
  Future<Either<Object, BaseResponseViewModel<List<BeerViewModel>>>> getBeers() {
    // TODO: implement getBeers
    throw UnimplementedError();
  }

  @override
  Future<Either<Object, BaseResponseViewModel<List<BreweryViewModel>>>> getBreweries() {
    // TODO: implement getBreweries
    throw UnimplementedError();
  }

  @override
  Future<Either<Object, BaseResponseViewModel<BeerViewModel>>> rateBeer(String beerId) {
    // TODO: implement rateBeer
    throw UnimplementedError();
  }
}
