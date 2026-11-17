import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';

import 'package:flutter/material.dart';

class ProductDetailsSkeleton extends StatelessWidget {
  const ProductDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image area
          Container(height: context.setHeight(440), color: Colors.white),
          SizedBox(height: context.setHeight(16)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.setWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price row + status
                Row(
                  children: [
                    _box(context, width: 110, height: 28),
                    SizedBox(width: context.setWidth(8)),
                    _box(context, width: 70, height: 20),
                    const Spacer(),
                    _box(context, width: 90, height: 18),
                  ],
                ),
                SizedBox(height: context.setHeight(8)),
                _box(context, width: 180, height: 14),
                SizedBox(height: context.setHeight(20)),

                // Description title + lines
                _box(context, width: 100, height: 18),
                SizedBox(height: context.setHeight(10)),
                _box(context, height: 14),
                SizedBox(height: context.setHeight(8)),
                _box(context, height: 14),
                SizedBox(height: context.setHeight(8)),
                _box(context, width: 220, height: 14),
              ],
            ),
          ),

          const Spacer(),

          // Button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.setWidth(16),
              vertical: context.setHeight(12),
            ),
            child: Container(
              height: context.setHeight(50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _box(BuildContext context, {double? width, required double height}) {
    return Container(
      width: width == null ? double.infinity : context.setWidth(width),
      height: context.setHeight(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}