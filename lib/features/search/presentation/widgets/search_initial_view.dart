import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/app_animations.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAnimations.searching,
            width: context.setWidth(400),
          ),
          Text(
            'searchForAnyProductsYouWant'.tr(),
            style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.primary
            ),
          ),
        ],
      ),
    );
  }
}
