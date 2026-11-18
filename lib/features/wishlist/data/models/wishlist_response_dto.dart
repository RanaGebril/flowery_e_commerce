import 'package:flowery_e_commerce/features/wishlist/data/models/wishlist_dto.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_response_dto.g.dart';

@JsonSerializable()
class WishListResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "wishlist")
  final WishlistDto? wishlist;

  WishListResponseDto ({
    this.message,
    this.count,
    this.wishlist,
  });

  factory WishListResponseDto.fromJson(Map<String, dynamic> json) {
    return _$WishListResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WishListResponseDtoToJson(this);
  }

  WishlistResponseEntity toEntity() {
    return WishlistResponseEntity(
      message: message,
      count: count,
      wishlist: wishlist?.toEntity(),
    );
  }
}
