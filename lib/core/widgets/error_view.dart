import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  const ErrorView({required this.errorMessage,super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: context.setMinSize(48),
            color: colorScheme.primary,
          ),
          SizedBox(height: context.setHeight(12)),
          Text('error'.tr(), style: textTheme.titleMedium),
          SizedBox(height: context.setHeight(5)),
          Text(errorMessage),
        ],
      ),
    );
  }
}
