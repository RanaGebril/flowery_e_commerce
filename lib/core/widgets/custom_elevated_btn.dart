
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/loading_icon.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.width,
    this.titleStyle,
    this.borderColor,
    this.isText = true,
    this.child,
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final Color? backgroundColor;
  final double? width;
  final TextStyle? titleStyle;
  final Color? borderColor;
  final bool isText;
  final Widget? child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? colorScheme.primary,
        disabledBackgroundColor: colorScheme.primary,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.setMinSize(100),
          ),
        ),
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          context.setHeight(50),
        ),
        side: borderColor != null
            ? BorderSide(color: borderColor!)
            : null,
      ),
      ///edit here
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? LoadingIcon()
          : isText
          ? FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.setHeight(14),
          ),
          child: Text(
            buttonTitle,
            style: titleStyle ??
                textTheme.bodyLarge?.copyWith(
                  color: colorScheme.secondary,
                ),
          ),
        ),
      )
          : child,
    );
  }
}
