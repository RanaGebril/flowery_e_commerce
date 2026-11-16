import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_entity.dart';

class WishlistResponseEntity extends Equatable {
  final String? message;
  final int? count;
  final WishlistEntity? wishlist;

  const WishlistResponseEntity({
    this.message,
    this.count,
    this.wishlist,
  });

  @override
  List<Object?> get props => [
    message,
    count,
    wishlist,
  ];
}