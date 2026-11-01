import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () =>
          context.pushNamed(RoutesNames.productDetails, extra: product),
      child: Container(
        padding: EdgeInsets.all(context.setRadius(8)),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onPrimary,
            width: context.setWidth(0.5),
          ),
          borderRadius: BorderRadius.circular(context.setRadius(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(context.setRadius(8)),
                child: Image.network(
                  product.imgCover ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.image_not_supported));
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall,
            ),
            Row(
              children: [
                Text(
                  '${'egp'.tr()} ${product.priceAfterDiscount}',
                  style: textTheme.labelLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: context.setWidth(10)),
                if ((product.discount ?? 0) > 0) ...[
                  Text(
                    '${product.discount}%',
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                ],
              ],
            ),
            if ((product.discount ?? 0) > 0)
              Text(
                '${product.price}',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimary,
                  decoration: TextDecoration.lineThrough,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: CustomElevatedButton(
                onPressed: (product.quantity ?? 0) > 0 ? () {} : null,
                isText: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 15,
                      color: colorScheme.surface,
                    ),
                    Text(
                      'addToCart'.tr(),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.surface,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
