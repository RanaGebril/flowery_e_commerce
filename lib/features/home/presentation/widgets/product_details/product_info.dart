import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final ProductEntity product;
  const ProductInfo({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: context.setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: context.setHeight(16)),
            Row(
            children: [
              Text(
                "${"egp".tr()} ${product.priceAfterDiscount}",
                style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: context.setWidth(8)),

              Text(
                "${"egp".tr()} ${product.price}",
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.error,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: colorScheme.error,
                ),
              ),
              Spacer(),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${'status'.tr()} ",
                      style: textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: product.quantity! <= 0
                          ? 'outOfStock'.tr()
                          : 'inStock'.tr(),

                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.setHeight(4)),
          Text('taxIncludedMessage'.tr(), style: textTheme.headlineSmall),
          SizedBox(height: context.setHeight(12)),
          Text('description'.tr(), style: textTheme.bodyLarge),
          SizedBox(height: context.setHeight(8)),
          Text(product.description ?? "", style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
