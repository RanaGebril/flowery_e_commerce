import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(height: context.setHeight(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("alreadyHaveAnAccount".tr(), style: textTheme.bodyLarge),
            SizedBox(width: context.setWidth(4)),

            GestureDetector(
              onTap: () => context.pop(),
              child: Text(
                "login".tr(),
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
