import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  final ProductEntity bestSeller;

  const BestSellerItem({
    required this.bestSeller,
    super.key,
  });

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
              bestSeller.imgCover ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
          ),
          SizedBox(height: context.setHeight(8)),
          Text(
            bestSeller.title ?? '',
            style: textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: context.setHeight(4)),
          Text(
            '${bestSeller.price} ${'egp'.tr()}',
            style: textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
