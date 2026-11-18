import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/product_details/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagesSection extends StatefulWidget {
  final ProductEntity product;
  const ProductImagesSection({
    required this.product,
    super.key,
  });

  @override
  State<ProductImagesSection> createState() => _ProductImagesSectionState();
}

PageController imagesController = PageController();

@override
void dispose() {
  imagesController.dispose();
}

class _ProductImagesSectionState extends State<ProductImagesSection> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Container(
          height: context.setHeight(440),
          padding: EdgeInsetsGeometry.only(
            top: context.setHeight(40),
            bottom: context.setHeight(10),
          ),
          color: colorScheme.secondary,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: imagesController,
                  itemCount: widget.product.images?.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: SizedBox(
                        width: context.setWidth(290),
                        height: context.setHeight(350),
                        child: Image.network(
                          widget.product.images?[index]??"",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: context.setHeight(5)),
              SmoothPageIndicator(
                controller: imagesController,
                count: widget.product.images?.length??0,
                effect: ScrollingDotsEffect(
                  dotWidth: context.setWidth(8),
                  dotHeight: context.setHeight(8),
                  activeDotColor: colorScheme.primary,
                  dotColor: colorScheme.onPrimary,
                  activeDotScale: 1.5,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: context.setHeight(40),
          right: context.setWidth(30),
          child: FavoriteButton(
            inWishlist: widget.product.isInWishlist??false,
            productId: widget.product.id??""
            ,
          ),
        ),
      ],
    );
  }
}
