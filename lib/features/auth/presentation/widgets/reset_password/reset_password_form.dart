import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/password_text_field.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/reset_password/reset_password_button.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    confirmPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  //
  // void _submit() {
  //   FocusScope.of(context).unfocus();
  //
  //   if (!formKey.currentState!.validate()) return;
  //
  //   // TODO: Send reset password event to your BLoC.
  //   // Use passwordController.text as the new password.
  // }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: context.setHeight(40)),

          PasswordTextField(
            controller: passwordController,
            label: 'password'.tr(),
            hintText: 'passwordHint'.tr(),
            showSuffixIcon: true,
            action: TextInputAction.next,
          ),

          SizedBox(height: context.setHeight(24)),

          PasswordTextField(
            controller: confirmPasswordController,
            label: 'confirmPassword'.tr(),
            hintText: 'confirmPasswordHint'.tr(),
            showSuffixIcon: true,
            action: TextInputAction.done,
            validator: (value) => Validators.validateConfirmPassword(
              value,
              passwordController.text,
            ),
          ),

          SizedBox(height: context.setHeight(24)),

          ResetPasswordButton(),
        ],
      ),
    );
  }
}
