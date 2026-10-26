import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/forget_password/confirm_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

final emailController = TextEditingController();
@override
void dispose() {
  emailController.dispose();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
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
            'enterRegisteredEmail'.tr(),
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.setHeight(40)),
          CustomTextFormField(
            controller: emailController,
            label: 'email'.tr(),
            hintText: 'emailHint'.tr(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.email_outlined, color: colorScheme.primary),
            validator: Validators.validateEmail,
          ),
          SizedBox(height: context.setHeight(40)),

          ConfirmButton(),
        ],
      ),
    );
  }
}
