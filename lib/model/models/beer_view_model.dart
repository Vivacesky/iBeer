import 'package:equatable/equatable.dart';
import 'package:i_beer/common/common.dart';
import 'package:i_beer/model/model.dart';

class BeerViewModel extends Equatable {
  final String id;
  final String name;
  final int? rating;
  final String thumbImageUrl;
  final String imageUrl;
  final BreweryViewModel brewery;

  const BeerViewModel({
    required this.id,
    required this.name,
    this.rating,
    required this.thumbImageUrl,
    required this.imageUrl,
    required this.brewery,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        rating,
        thumbImageUrl,
        imageUrl,
        brewery,
      ];

  factory BeerViewModel.orThrow({
    required String? id,
    required String? name,
    required int? rating,
    required String? thumbImageUrl,
    required String? imageUrl,
    required BreweryViewModel? brewery,
  }) {
    return BeerViewModel(
      id: validateNotNull('id', id),
      name: validateNotNull('name', name),
      rating: rating,
      thumbImageUrl: validateNotNull("thumbImageUrl", thumbImageUrl),
      imageUrl: validateNotNull("imageUrl", imageUrl),
      brewery: validateNotNull("brewery", brewery),
    );
  }
}
