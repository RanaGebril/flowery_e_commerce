import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class CategoryItemSkeleton extends StatelessWidget {
  const CategoryItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          height: context.setHeight(64),
          width: context.setWidth(68),
          margin: EdgeInsets.only(right: context.setWidth(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.setRadius(20)),
            color: colorScheme.secondary,
          ),
        ),
        SizedBox(height: context.setHeight(8)),
        Container(
          height: context.setHeight(10),
          width: context.setWidth(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}