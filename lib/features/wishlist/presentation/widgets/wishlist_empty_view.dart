import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WishlistEmptyView extends StatelessWidget {
  const WishlistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
        'emptyWishlist'.tr(),
        style: textTheme.bodyLarge?.copyWith(color: colorScheme.onPrimary),
      ),
    );
  }
}
