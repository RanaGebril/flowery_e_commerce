import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagesSection extends StatefulWidget {
  final List<String> productImages;
  const ProductImagesSection({required this.productImages, super.key});

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
                  itemCount: widget.productImages.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: SizedBox(
                        width: context.setWidth(290),
                        height: context.setHeight(350),
                        child: Image.network(
                          widget.productImages[index],
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
                count: widget.productImages.length,
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
          child: Container(
            padding: EdgeInsets.all(context.setMinSize(8)),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              shape: BoxShape.circle,
              border: BoxBorder.all(
                width: context.setWidth(1),
                color:AppColors.green,
              ),
            ),
            child: GestureDetector(
              child: Icon(
                Icons.favorite,
                color: colorScheme.primary,
                size: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
