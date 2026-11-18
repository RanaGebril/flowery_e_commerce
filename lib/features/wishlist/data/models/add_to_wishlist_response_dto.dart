import 'package:json_annotation/json_annotation.dart';

part 'add_to_wishlist_response_dto.g.dart';

@JsonSerializable()
class AddToWishlistResponseDto {
  final String message;

  const AddToWishlistResponseDto({required this.message});

  factory AddToWishlistResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddToWishlistResponseDtoFromJson(json);
}
