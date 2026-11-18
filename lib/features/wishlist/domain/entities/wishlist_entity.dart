import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable {
  final String? id;
  final String? user;
  final List<ProductEntity>? products;

  const WishlistEntity({this.id, this.user, this.products});

  @override
  List<Object?> get props => [id, user, products];
}
