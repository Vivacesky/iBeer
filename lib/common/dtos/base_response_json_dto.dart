import 'package:i_beer/common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_json_dto.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponseJsonDto<T> {
  MetaJsonDto? meta;
  T? data;

  BaseResponseJsonDto({
    this.meta,
    this.data,
  });

  factory BaseResponseJsonDto.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseJsonDtoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResponseJsonDtoToJson(this, toJsonT);
}
