// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brewery_json_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreweryJsonDto _$BreweryJsonDtoFromJson(Map<String, dynamic> json) => BreweryJsonDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$BreweryJsonDtoToJson(BreweryJsonDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
    };
