import 'package:json_annotation/json_annotation.dart';

part 'meta_data_response_dto.g.dart';

@JsonSerializable()
class  MeteDataResponseDto{
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  MeteDataResponseDto ({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  factory MeteDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MeteDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MeteDataResponseDtoToJson(this);
  }

}
