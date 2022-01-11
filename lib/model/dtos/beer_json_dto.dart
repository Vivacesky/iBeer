import 'package:i_beer/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'beer_json_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BeerJsonDto {
  String? id;
  String? name;
  int? rating;
  String? thumbImageUrl;
  String? imageUrl;
  BreweryJsonDto? brewery;

  BeerJsonDto({
    this.id,
    this.name,
    this.rating,
    this.thumbImageUrl,
    this.imageUrl,
    this.brewery,
  });

  factory BeerJsonDto.fromJson(Map<String, dynamic> json) => _$BeerJsonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BeerJsonDtoToJson(this);
}
