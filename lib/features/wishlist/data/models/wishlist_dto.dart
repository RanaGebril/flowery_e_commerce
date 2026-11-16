import 'package:flowery_e_commerce/features/home/data/models/product_dto.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_dto.g.dart';


@JsonSerializable()
class WishlistDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "products")
  final List<ProductsDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  WishlistDto ({
    this.id,
    this.user,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WishlistDto.fromJson(Map<String, dynamic> json) {
    return _$WishlistDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WishlistDtoToJson(this);
  }

  WishlistEntity toEntity() {
    return WishlistEntity(
      id: id,
      user: user,
      products: products?.map((product) => product.toEntity()).toList(),
    );
  }
}

