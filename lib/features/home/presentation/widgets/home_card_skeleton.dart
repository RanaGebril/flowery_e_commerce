import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class HomeCardSkeleton extends StatelessWidget {
  const HomeCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: context.setWidth(131),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image skeleton
          Container(
            height: context.setHeight(151),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.setRadius(8)),
              color: colorScheme.secondary,
            ),
          ),

          SizedBox(height: context.setHeight(8)),

          // Product title skeleton
          Container(
            height: context.setHeight(12),
            width: context.setWidth(110),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: colorScheme.secondary,
            ),
          ),

          SizedBox(height: context.setHeight(4)),

          // Product price skeleton
          Container(
            height: context.setHeight(14),
            width: context.setWidth(65),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
