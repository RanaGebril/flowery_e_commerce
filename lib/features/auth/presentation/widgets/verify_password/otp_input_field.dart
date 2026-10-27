import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final String? errorMessage;
  final ValueChanged<String>? onChanged;

  const OtpInputField({
    super.key,
    required this.controller,
    this.hasError = false,
    this.errorMessage,
    this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final defaultPinTheme = PinTheme(
      width: context.setWidth(74),
      height: context.setHeight(50),
      textStyle: textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: AppColors.white[60],
        borderRadius: BorderRadius.circular(context.setRadius(10)),
      ),
    );

    final focusedPinTheme = PinTheme(
      width: context.setWidth(74),
      height: context.setHeight(50),
      textStyle: textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(context.setRadius(10)),
        border: Border.all(color: colorScheme.primary),
      ),
    );

    final errorPinTheme = PinTheme(
      width: context.setWidth(74),
      height: context.setHeight(50),
      textStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
      decoration: BoxDecoration(
        color: AppColors.white[60],
        borderRadius: BorderRadius.circular(context.setRadius(10)),
        border: Border.all(color: colorScheme.error),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      forceErrorState: hasError,
      errorText: hasError ? errorMessage : null,
      errorTextStyle: textTheme.bodySmall?.copyWith(color: colorScheme.error),
      onChanged: onChanged,
    );
  }
}
