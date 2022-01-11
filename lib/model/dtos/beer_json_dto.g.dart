// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_json_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeerJsonDto _$BeerJsonDtoFromJson(Map<String, dynamic> json) => BeerJsonDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      rating: json['rating'] as int?,
      thumbImageUrl: json['thumbImageUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      brewery: json['brewery'] == null
          ? null
          : BreweryJsonDto.fromJson(json['brewery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeerJsonDtoToJson(BeerJsonDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'thumbImageUrl': instance.thumbImageUrl,
      'imageUrl': instance.imageUrl,
      'brewery': instance.brewery?.toJson(),
    };
