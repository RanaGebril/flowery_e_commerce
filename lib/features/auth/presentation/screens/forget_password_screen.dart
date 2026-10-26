import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/forget_password/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forgetPassword2".tr()),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ForgetPasswordBody(),
    );
  }
}
