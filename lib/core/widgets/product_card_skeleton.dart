import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(context.setRadius(8)),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.onPrimary,
          width: context.setWidth(0.5),
        ),
        borderRadius: BorderRadius.circular(context.setRadius(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(context.setRadius(8)),
            ),
          ),

          const SizedBox(height: 8),

          // Product Title
          Container(
            height: 12,
            width: context.setWidth(110),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(height: 6),

          Container(
            height: 12,
            width: context.setWidth(75),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(height: 8),

          // Price and Discount
          Row(
            children: [
              Container(
                height: 14,
                width: context.setWidth(65),
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 12,
                width: context.setWidth(30),
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const Spacer(),

          // Add To Cart Button
          Container(
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(context.setRadius(20)),
            ),
          ),
        ],
      ),
    );
  }
}