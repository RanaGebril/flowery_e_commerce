import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      buttonTitle: 'confirmButton'.tr(),
      isLoading: false,
      onPressed: () {},
    );
  }
}
