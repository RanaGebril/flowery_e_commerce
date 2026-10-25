import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/login_button.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/password_text_field.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/remember_me_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
        LoginRequestEvent(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: context.setHeight(10)),
          CustomTextFormField(
            controller: emailController,
            label: 'email'.tr(),
            hintText: 'emailHint'.tr(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.email_outlined, color: colorScheme.primary),
            validator: Validators.validateEmail,
          ),
          SizedBox(height: context.setHeight(20)),
          PasswordTextField(controller: passwordController,label: 'password',hintText: 'passwordHint',),
          SizedBox(height: context.setHeight(10)),
          const RememberMeRow(),
          SizedBox(height: context.setHeight(64)),
          LoginButton(onPressed: _submit),
        ],
      ),
    );
  }
}