import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class SearchEmptyView extends StatelessWidget {
  final TextStyle? textStyle;

  const SearchEmptyView({
    super.key,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        'noProductsFound'.tr(),
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
