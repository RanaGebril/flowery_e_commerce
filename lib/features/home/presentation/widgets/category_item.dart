
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryItem({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        // navigate to categories
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: context.setHeight(64),
            width: context.setWidth(68),
            padding: EdgeInsets.all(context.setMinSize(18)),
            margin: EdgeInsetsDirectional.only(
              end: context.setWidth(16),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                context.setRadius(20),
              ),
              color: colorScheme.secondary,
            ),
            child: Image.network(
              category.image ?? '',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
          SizedBox(height: context.setHeight(8)),
          SizedBox(
            width: context.setWidth(84),
            child: Text(
              category.slug?.toLowerCase() ?? '',
              style: textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
