import 'package:dartz/dartz.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';

abstract class BeerRepository {
  Future<Either<Object, BaseResponseViewModel<List<BeerViewModel>>>> getBeers();

  Future<Either<Object, BaseResponseViewModel<List<BreweryViewModel>>>> getBreweries();

  Future<Either<Object, BaseResponseViewModel<BeerViewModel>>> rateBeer(String beerId, int rating);
}

class CachedBeerRepository implements BeerRepository {
  final BeerRemoteService beerRemoteService;

  const CachedBeerRepository(this.beerRemoteService);

  @override
  Future<Either<Object, BaseResponseViewModel<List<BeerViewModel>>>> getBeers() async {
    try {
      final result = await beerRemoteService.getBeers();
      final mappedResponse = BaseResponseViewModel.orThrow(
        meta: mappedMeta(result?.meta),
        data: result?.data?.map((b) => mappedBeer(b)).toList(),
      );
      return Right(mappedResponse);
    } catch (ex) {
      return Left(ex);
    }
  }

  @override
  Future<Either<Object, BaseResponseViewModel<List<BreweryViewModel>>>> getBreweries() async {
    try {
      final result = await beerRemoteService.getBreweries();
      final mappedResponse = BaseResponseViewModel.orThrow(
        meta: mappedMeta(result?.meta),
        data: result?.data?.map((b) => mappedBrewery(b)!).toList(),
      );
      return Right(mappedResponse);
    } catch (ex) {
      return Left(ex);
    }
  }

  @override
  Future<Either<Object, BaseResponseViewModel<BeerViewModel>>> rateBeer(String beerId, int rating) async {
    try {
      final result = await beerRemoteService.rateBeer(beerId, rating);
      final mappedResponse = BaseResponseViewModel.orThrow(
        meta: mappedMeta(result?.meta),
        data: mappedBeer(result?.data),
      );
      return Right(mappedResponse);
    } catch (ex) {
      return Left(ex);
    }
  }

  MetaViewModel mappedMeta(MetaJsonDto? dto) {
    return MetaViewModel.orThrow(
      count: dto?.count,
      totalCount: dto?.totalCount,
      type: dto?.type,
    );
  }

  BeerViewModel mappedBeer(BeerJsonDto? dto) {
    return BeerViewModel.orThrow(
      id: dto?.id,
      name: dto?.name,
      rating: dto?.rating,
      thumbImageUrl: dto?.thumbImageUrl,
      imageUrl: dto?.imageUrl,
      brewery: mappedBrewery(dto?.brewery),
    );
  }

  /// This shouln't be nullable, but BE returns null brewery after the rating
  BreweryViewModel? mappedBrewery(BreweryJsonDto? dto) {
    if (dto == null) return null;
    return BreweryViewModel.orThrow(
      id: dto.id,
      name: dto.name,
      address: dto.address,
      city: dto.city,
      country: dto.country,
    );
  }
}
