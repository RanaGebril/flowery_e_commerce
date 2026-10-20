import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        CustomElevatedButton(
          buttonTitle: 'continueAsGuest'.tr(),
          backgroundColor: Colors.transparent,
          borderColor: colorScheme.onSecondary,
          titleStyle: TextStyle(color: colorScheme.onSecondary),
          onPressed: () => context.pushReplacementNamed(RoutesNames.home),
        ),
        SizedBox(height: context.setHeight(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("donNotHaveAccount".tr(), style: textTheme.bodyLarge),
            SizedBox(width: context.setWidth(4)),
            GestureDetector(
              onTap: () => context.pushNamed(RoutesNames.signup),
              child: Text(
                "signup".tr(),
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
