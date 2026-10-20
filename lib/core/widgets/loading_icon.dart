import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: context.setHeight(56),
      child: LoadingAnimationWidget.waveDots(
        color: colorScheme.surface,
        size: context.setWidth(25),
      ),
    );
  }
}
