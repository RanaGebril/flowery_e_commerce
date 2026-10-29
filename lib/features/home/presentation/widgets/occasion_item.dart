import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/occasion_entity.dart';
import 'package:flutter/material.dart';

class OccasionItem extends StatelessWidget {
  final OccasionEntity occasion;
  const OccasionItem({required this.occasion, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: context.setWidth(131),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.setHeight(151),
            width: double.infinity,
            child: Image.network(
              occasion.image ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
          SizedBox(height: context.setHeight(8)),
          Text(
            occasion.name ?? '',
            style: textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
