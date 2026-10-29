import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/occasion_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';

class HomeContentEntity extends Equatable {
  final String? message;
  final List<ProductEntity>? products;
  final List<CategoryEntity>? categories;
  final List<ProductEntity>? bestSeller;
  final List<OccasionEntity>? occasions;

  const HomeContentEntity({
    this.message,
    this.products,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  @override
  List<Object?> get props => [
    message,
    products,
    categories,
    bestSeller,
    occasions,
  ];
}