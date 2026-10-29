import 'package:flowery_e_commerce/features/home/data/models/category_dto.dart';
import 'package:flowery_e_commerce/features/home/data/models/occasions_dto.dart';
import 'package:flowery_e_commerce/features/home/data/models/product_dto.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/Home_content_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_content_response_dto.g.dart';

@JsonSerializable()
class HomeContentResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "products")
  final List<ProductsDto>? products;
  @JsonKey(name: "categories")
  final List<CategoryDto>? categories;
  @JsonKey(name: "bestSeller")
  final List<ProductsDto>? bestSeller;

  @JsonKey(name: "occasions")
  final List<OccasionsDto>? occasions;

  HomeContentResponseDto ({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  factory HomeContentResponseDto.fromJson(Map<String, dynamic> json) {
    return _$HomeContentResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeContentResponseDtoToJson(this);
  }

  HomeContentEntity toEntity() {
    return HomeContentEntity(
      message: message,
      products: products
          ?.map((product) => product.toEntity())
          .toList(),
      categories: categories
          ?.map((category) => category.toEntity())
          .toList(),
      bestSeller: bestSeller
          ?.map((product) => product.toEntity())
          .toList(),
      occasions: occasions
          ?.map((occasion) => occasion.toEntity())
          .toList(),
    );
  }
}

