import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/layout/bloc/layout_bloc.dart';
import 'package:flowery_e_commerce/layout/bloc/layout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.read<MainLayoutBloc>().add(OpenCategoryEvent(category.id!));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: context.setWidth(68),
            padding: const EdgeInsets.all(14),
            margin: EdgeInsetsDirectional.only(end: context.setWidth(16)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.setRadius(20)),
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
          const SizedBox(height: 8),
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
