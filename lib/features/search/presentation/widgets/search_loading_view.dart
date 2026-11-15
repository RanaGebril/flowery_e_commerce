import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/product_card_skeleton.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';
import 'package:flutter/material.dart';

class  SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          vertical: context.setHeight(16),
        ),
        itemCount: 6,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.63,
        ),
        itemBuilder: (context, index) {
          return const ProductCardSkeleton();
        },
      ),
    );
  }
}
