
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? iconSize;
  final double borderRadius;

  const CustomOutlinedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 25,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(


      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.primary,
          width: context.setWidth(1),
        ),
        borderRadius: BorderRadius.circular(
          context.setRadius(borderRadius),
        ),
      ),
      child: IconButton(
        style: const ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStatePropertyAll(
            Colors.transparent,
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: colorScheme.primary,
          size: context.setMinSize(iconSize!),
        ),
      ),
    );
  }
}
