import 'package:json_annotation/json_annotation.dart';

part 'brewery_json_dto.g.dart';

@JsonSerializable()
class BreweryJsonDto {
  String? id;
  String? name;
  String? address;
  String? city;
  String? country;

  BreweryJsonDto({
    this.id,
    this.name,
    this.address,
    this.city,
    this.country,
  });

  factory BreweryJsonDto.fromJson(Map<String, dynamic> json) => _$BreweryJsonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BreweryJsonDtoToJson(this);
}
