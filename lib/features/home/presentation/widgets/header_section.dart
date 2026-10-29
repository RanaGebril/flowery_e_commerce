import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const HeaderSection({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(16)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.tr(),
              style: textTheme.headlineMedium?.copyWith(color: AppColors.black),
            ),
          ),
          TextButton(
            onPressed: onViewAll,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'viewAll'.tr(),
              style: textTheme.displaySmall?.copyWith(
                color: colorScheme.primary,
                decorationColor: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
