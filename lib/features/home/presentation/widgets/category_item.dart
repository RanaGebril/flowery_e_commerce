import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  const CategoryItem({required this.category,super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        //navigate to categories
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: context.setHeight(64),
              width: context.setWidth(68),
              padding: EdgeInsetsGeometry.all(context.setMinSize(18)),
              margin: EdgeInsetsGeometry.only(right: context.setWidth(16)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.setRadius(20)),
                  color: colorScheme.secondary
              ),
              child: Image.network(
                category.image!,
                height: context.setHeight(24),
                width: context.setWidth(24),
              )
          ),
          SizedBox(height: context.setHeight(8),),
          Text(category.slug!.toLowerCase(),style: textTheme.bodyMedium,)

        ],
      ),
    );
  }
}
