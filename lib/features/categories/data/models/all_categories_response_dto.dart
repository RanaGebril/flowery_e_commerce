import 'package:flowery_e_commerce/features/home/data/models/category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta_data_response_dto.dart';

part 'all_categories_response_dto.g.dart';

@JsonSerializable()
class AllCategoriesResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MeteDataResponseDto? metadata;
  @JsonKey(name: "categories")
  final List<CategoryDto>? categories;

  AllCategoriesResponseDto ({
    this.message,
    this.metadata,
    this.categories,
  });

  factory AllCategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AllCategoriesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllCategoriesResponseDtoToJson(this);
  }
}


