import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/product_card_skeleton.dart';
import 'package:flutter/material.dart';

class CustomTabsSkeleton extends StatelessWidget {
  const CustomTabsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Tabs Skeleton
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (_, __) =>
                SizedBox(width: context.setWidth(20)),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 14,
                    width: context.setWidth(55),
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 3,
                    width: context.setWidth(55),
                    color: index == 0
                        ? colorScheme.primary
                        : Colors.transparent,
                  ),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        // Products Grid Skeleton
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
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
        ),
      ],
    );
  }
}