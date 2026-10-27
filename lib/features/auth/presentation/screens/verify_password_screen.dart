import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/verify_password/verify_password_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyPasswordScreen extends StatelessWidget {
  const VerifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("emailVerificationTitle".tr()),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: VerifyPasswordBody(),
    );
  }
}
