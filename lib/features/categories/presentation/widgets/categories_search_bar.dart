import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class CategoriesSearchBar extends StatelessWidget {
  final double searchBarWidth;
  final double searchBarHeight;
  const CategoriesSearchBar({
    required this.searchBarWidth,
    required this.searchBarHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: context.setWidth(searchBarWidth),
        height: context.setHeight(searchBarHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(context.setRadius(8)),
          border: BoxBorder.all(
            color: colorScheme.onPrimary,
            width: context.setWidth(1),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.directional(
                start: context.setWidth(5),
                end: context.setWidth(10),
              ),
              child: Icon(Icons.search, color: colorScheme.onPrimary),
            ),
            Text(
              'search'.tr(),
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
