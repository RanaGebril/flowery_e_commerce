import 'package:flowery_e_commerce/features/home/data/models/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specific_product_response_dto.g.dart';

@JsonSerializable()
class SpecificProductResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "product")
  final ProductsDto? product;

  SpecificProductResponseDto({this.message, this.product});

  factory SpecificProductResponseDto.fromJson(Map<String, dynamic> json) {
    return _$SpecificProductResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SpecificProductResponseDtoToJson(this);
  }
}
