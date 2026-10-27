import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';

import 'package:flowery_e_commerce/features/auth/presentation/widgets/reset_password/reset_password_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key});

  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: context.setWidth(16)),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: context.setHeight(40)),

            Text(
              'resetPasswordSubTitle'.tr(),
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            ResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
