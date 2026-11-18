class WishlistEvent {}

class AddToWishlistEvent extends WishlistEvent {
  String productId;

  AddToWishlistEvent({required this.productId});
}

class RemoveFromWishlistEvent extends WishlistEvent {
  String productId;

  RemoveFromWishlistEvent({required this.productId});
}

class GetWishlistEvent extends WishlistEvent {}
