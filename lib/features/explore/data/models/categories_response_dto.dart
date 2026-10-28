import 'package:flowery_e_commerce/features/explore/data/models/category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata_dto.dart';

part 'categories_response_dto.g.dart';

@JsonSerializable()
class CategoriesResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "categories")
  final List<CategoryDto> categories;

  CategoriesResponseDto ({
    this.message,
    this.metadata,
    required this.categories,
  });

  factory CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesResponseDtoToJson(this);
  }
}



