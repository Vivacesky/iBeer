import 'package:json_annotation/json_annotation.dart';

part 'meta_json_dto.g.dart';

@JsonSerializable()
class MetaJsonDto {
  int? count;
  int? totalCount;
  String? type;

  MetaJsonDto({
    this.count,
    this.totalCount,
    this.type,
  });

  factory MetaJsonDto.fromJson(Map<String, dynamic> json) => _$MetaJsonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaJsonDtoToJson(this);
}
