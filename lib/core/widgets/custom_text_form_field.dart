import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscuringCharacter = "*",
    this.validator,
    this.textInputAction,
    this.hintStyle,
    this.contentPadding,
    this.style,
    this.onTap,
    this.enabled,
    this.suffixIconConstraints,
    this.maxLength,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.label,
    this.labelStyle,
    this.borderRadius = 10,
    this.disabledBorderColor,
    this.isReadOnly = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.prefixText
  });
  final String? initialValue;
  final String? hintText;
  final String? label;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final String obscuringCharacter;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final bool? enabled;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  final double borderRadius;
  final Color? disabledBorderColor;
  final bool? isReadOnly;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final TextEditingController internalController =
        controller ?? TextEditingController(text: initialValue);

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      style: style ?? textTheme.bodyMedium,
      controller: internalController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      readOnly: isReadOnly ?? false,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(
              horizontal: context.setMinSize(16),
              vertical: context.setMinSize(4),
            ),
        filled: isReadOnly,
        fillColor: isReadOnly == true ? colorScheme.onPrimary : null,
        label: FittedBox(
          fit: BoxFit.scaleDown,
          child: (label != null)
              ? Text(label!, style: labelStyle ?? textTheme.bodyMedium)
              : null,
        ),
        hintStyle:
            hintStyle ??
            textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
        hintText: hintText,

        enabledBorder: buildOutlinedBorder(
          context: context,
          borderColor: colorScheme.onPrimary,
          borderRadius: borderRadius,
        ),

        focusedBorder: buildOutlinedBorder(
          context: context,
          borderColor: colorScheme.primary,
          borderRadius: borderRadius,
        ),

        errorBorder: buildOutlinedBorder(
          context: context,
          borderColor: colorScheme.error,
          borderRadius: borderRadius,
        ),

        focusedErrorBorder: buildOutlinedBorder(
          context: context,
          borderColor: colorScheme.error,
          borderRadius: borderRadius,
        ),

        disabledBorder: buildOutlinedBorder(
          context: context,
          borderColor: colorScheme.onSurface.withValues(alpha: 0.12),
          borderRadius: borderRadius,
        ),

        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: prefixIcon,
        ),
        prefixIconConstraints:
            prefixIconConstraints ??
            BoxConstraints(
              maxWidth: context.setWidth(60),
              maxHeight: context.setHeight(60),
            ),
        suffixIconConstraints:
            suffixIconConstraints ??
            BoxConstraints(
              maxWidth: context.setWidth(60),
              maxHeight: context.setHeight(60),
            ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: suffixIcon,
        ),
        errorStyle: textTheme.bodySmall?.copyWith(color: colorScheme.error),
        errorMaxLines: 3,
        prefixText: prefixText,
        prefixStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
      maxLength: maxLength,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: validator,
      enabled: enabled,
      cursorColor: colorScheme.onSurface,

    );
  }

  static OutlineInputBorder buildOutlinedBorder({
    required BuildContext context,
    required Color borderColor,
    required double borderRadius,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.setMinSize(borderRadius)),
      borderSide: BorderSide(color: borderColor),
    );
  }
}