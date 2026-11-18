import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/product_card.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistResultsGrid extends StatelessWidget {
  final List<ProductEntity> products;

  const WishlistResultsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: context.setHeight(16)),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.63,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onReturn: (changed) {
            if (changed == true && context.mounted) {
              context.read<WishlistBloc>().add(GetWishlistEvent());
            }
          },
        );
      },
    );
  }
}
