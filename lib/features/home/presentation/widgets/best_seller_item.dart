import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  final ProductEntity bestSeller;

  const BestSellerItem({
    required this.bestSeller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => context.pushNamed(
        RoutesNames.productDetails,
        extra: bestSeller,
      ),
      child: SizedBox(
        width: context.setWidth(131),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The image takes whatever height is left, so it can never overflow.
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  bestSeller.imgCover ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.image_not_supported));
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bestSeller.title ?? '',
              style: textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '${bestSeller.price} ${'egp'.tr()}',
              style: textTheme.labelLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}