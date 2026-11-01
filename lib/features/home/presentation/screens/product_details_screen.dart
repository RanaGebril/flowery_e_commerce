import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/product_details/product_images_section.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/product_details/product_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: Container(
        width: context.setWidth(30),
        height: context.setHeight(40),
        decoration: BoxDecoration(
          color: colorScheme.surface,

          borderRadius: BorderRadiusGeometry.circular(25),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colorScheme.onSurface),
          onPressed: context.pop,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    ProductImagesSection(productImages: product.images ?? []),
                    ProductInfo(product: product),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.setWidth(16),
                        vertical: context.setHeight(12),
                      ),
                      child: CustomElevatedButton(
                        onPressed: product.quantity! >= 0?null:() {},
                        buttonTitle: 'addToCart'.tr(),
                        isText: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
