
import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;


  const FavoriteButton({
    super.key,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.all(context.setMinSize(8)),
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          shape: BoxShape.circle,
          border: Border.all(
            width: context.setWidth(1),
            color: AppColors.green,
          ),
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: colorScheme.primary,
          size: 26,
        ),
      ),
    );
  }
}
