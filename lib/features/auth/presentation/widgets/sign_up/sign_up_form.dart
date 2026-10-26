
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flowery_e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/password_text_field.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/sign_up/gender_selector.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) return;

    final signUpBloc = context.read<SignUpBloc>();
    final selectedGender = signUpBloc.state.selectedGender;

    final phone = phoneController.text.trim();
    final formattedPhone =
        '+20${phone.startsWith('0') ? phone.substring(1) : phone}';

    signUpBloc.add(
      SignUpRequestEvent(
        user: SignUpEntity(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
          phone: formattedPhone,
          gender: selectedGender,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.setWidth(16),
        ),
        child: Column(
          children: [
            SizedBox(height: context.setHeight(10)),

            // First Name & Last Name
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: firstNameController,
                    label: 'firstName'.tr(),
                    hintText: 'firstNameHint'.tr(),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validateName,
                  ),
                ),
                SizedBox(width: context.setWidth(10)),
                Expanded(
                  child: CustomTextFormField(
                    controller: lastNameController,
                    label: 'lastName'.tr(),
                    hintText: 'lastNameHint'.tr(),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validateName,
                  ),
                ),
              ],
            ),

            SizedBox(height: context.setHeight(24)),

            // Email
            CustomTextFormField(
              controller: emailController,
              label: 'email'.tr(),
              hintText: 'emailHint'.tr(),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: Validators.validateEmail,
            ),

            SizedBox(height: context.setHeight(24)),

            // Password & Confirm Password
            Row(
              children: [
                Expanded(
                  child: PasswordTextField(
                    controller: passwordController,
                    label: 'password',
                    hintText: 'passwordHint',
                    action: TextInputAction.next,
                    showSuffixIcon: false,
                  ),
                ),
                SizedBox(width: context.setWidth(10)),
                Expanded(
                  child: PasswordTextField(
                    controller: confirmPasswordController,
                    label: 'confirmPassword',
                    hintText: 'confirmPasswordHint',
                    action: TextInputAction.next,
                    validator: (value) =>
                        Validators.validateConfirmPassword(
                          value,
                          passwordController.text,
                        ),
                    showSuffixIcon: false,
                  ),
                ),
              ],
            ),

            SizedBox(height: context.setHeight(24)),

            // Phone Number
            CustomTextFormField(
              controller: phoneController,
              label: 'phoneNumber'.tr(),
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              prefixText: '+20 ',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              validator: Validators.validatePhone,
            ),

            SizedBox(height: context.setHeight(24)),

            // Gender
            const GenderSelector(),

            SizedBox(height: context.setHeight(16)),

            // Terms and Conditions
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'createAnAccountYouAgree'.tr(),
                    style: textTheme.bodySmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Open Terms and Conditions.
                    },
                    child: Text(
                      'termsAndConditions'.tr(),
                      style: textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: context.setHeight(30)),

            // Sign Up Button
            SignUpButton(onPressed: _submit),
          ],
        ),
      ),
    );
  }
}
