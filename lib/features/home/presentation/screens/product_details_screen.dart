import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_event.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_state.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/product_details/product_details_skeleton.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/product_details/product_images_section.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/product_details/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  const ProductDetailsScreen({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) =>
          getIt<HomeBloc>()..add(GetSpecificProductEvent(productId: productId)),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final product = state.getSpecificProductState.data;
          return Scaffold(
            floatingActionButton: Container(
              width: context.setWidth(30),
              height: context.setHeight(40),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: colorScheme.onSurface),
                onPressed: context.pop,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            body: product == null
                ? const ProductDetailsSkeleton()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final bool inStock = (product.quantity ?? 0) > 0;

                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                ProductImagesSection(product: product),
                                ProductInfo(product: product),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.setWidth(16),
                                    vertical: context.setHeight(12),
                                  ),
                                  child: CustomElevatedButton(
                                    onPressed: inStock
                                        ? () {
                                            // TODO: add to cart
                                          }
                                        : null,
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
        },
      ),
    );
  }
}
