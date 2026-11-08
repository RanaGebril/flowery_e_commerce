import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/categories_search_bar.dart';
import 'package:flutter/material.dart';

class CategoriesAppBar extends StatelessWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        CategoriesSearchBar(searchBarWidth: 270, searchBarHeight: 50),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: context.setWidth(64),
            height: context.setHeight(50),
            padding: EdgeInsetsGeometry.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(context.setRadius(8)),
              border: BoxBorder.all(
                color: colorScheme.onPrimary,
                width: context.setWidth(1),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.directional(
                start: context.setWidth(5),
                end: context.setWidth(10),
              ),
              child: Icon(Icons.sort, color: colorScheme.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
