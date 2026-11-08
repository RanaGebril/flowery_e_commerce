import 'package:flowery_e_commerce/features/home/data/models/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta_data_response_dto.dart';

part 'all_products_response_dto.g.dart';

@JsonSerializable()
class AllProductsResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MeteDataResponseDto? metadata;
  @JsonKey(name: "products")
  final List<ProductsDto>? products;

  AllProductsResponseDto ({
    this.message,
    this.metadata,
    this.products,
  });

  factory AllProductsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AllProductsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllProductsResponseDtoToJson(this);
  }
}
