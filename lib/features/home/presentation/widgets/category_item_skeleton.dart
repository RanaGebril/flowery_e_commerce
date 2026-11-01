import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class CategoryItemSkeleton extends StatelessWidget {
  const CategoryItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 64,
          width: context.setWidth(68),
          margin: EdgeInsetsDirectional.only(end: context.setWidth(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.setRadius(20)),
            color: colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 12,
          width: context.setWidth(50),
          margin: EdgeInsetsDirectional.only(end: context.setWidth(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}