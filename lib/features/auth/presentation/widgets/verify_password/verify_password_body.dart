import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/verify_password/otp_input_field.dart';

import 'package:flutter/material.dart';

class VerifyPasswordBody extends StatefulWidget {
  const VerifyPasswordBody({super.key});

  @override
  State<VerifyPasswordBody> createState() => _VerifyPasswordBodyState();
}

class _VerifyPasswordBodyState extends State<VerifyPasswordBody> {
  final pinController = TextEditingController();

  bool hasError = false;

  final String errorMessage = 'Invalid verification code. Please try again.';

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: context.setHeight(40)),

          Text(
            'emailVerificationSubTitle'.tr(),
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: context.setHeight(40)),

          OtpInputField(
            controller: pinController,
            hasError: hasError,
            errorMessage: errorMessage,
            onChanged: (_) {
              if (hasError) {
                setState(() {
                  hasError = false;
                });
              }
            },
          ),

          SizedBox(height: context.setHeight(32)),
          //
          // // Temporary button to test the error UI.
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       hasError = true;
          //     });
          //   },
          //   child: const Text('Test Error UI'),
          // ),
          //
          // TextButton(
          //   onPressed: () {
          //     setState(() {
          //       hasError = false;
          //     });
          //     pinController.clear();
          //   },
          //   child: const Text('Clear Error'),
          // ),
          //
          // SizedBox(height: context.setHeight(16)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'notReceivedCodeStatement'.tr(),
                  style: textTheme.bodyLarge,
                ),
              ),
              SizedBox(width: context.setWidth(4)),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'resend'.tr(),
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
      ),
    );
  }
}
