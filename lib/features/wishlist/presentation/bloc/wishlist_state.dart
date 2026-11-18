import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_response_entity.dart';

class WishlistState extends Equatable {
  final StateStatus<WishlistResponseEntity> getWishlistStatus;
  final StateStatus<void> addToWishlistStatus;
  final StateStatus<void> removeFromWishlistStatus;

  const WishlistState({
    this.getWishlistStatus = const StateStatus.initial(),
    this.addToWishlistStatus = const StateStatus.initial(),
    this.removeFromWishlistStatus = const StateStatus.initial(),
  });

  WishlistState copyWith({
    StateStatus<WishlistResponseEntity>? getWishlistStatus,
    StateStatus<void>? addToWishlistStatus,
    StateStatus<void>? removeFromWishlistStatus,
  }) {
    return WishlistState(
      getWishlistStatus: getWishlistStatus ?? this.getWishlistStatus,
      addToWishlistStatus: addToWishlistStatus ?? this.addToWishlistStatus,
      removeFromWishlistStatus:
          removeFromWishlistStatus ?? this.removeFromWishlistStatus,
    );
  }

  @override
  List<Object?> get props => [
    addToWishlistStatus,
    getWishlistStatus,
    removeFromWishlistStatus,
  ];
}
