import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/utils/validators.dart';
import 'package:flowery_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.action,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputAction? action;
  final String? Function(String?)? validator;

  @override
  State<PasswordTextField> createState() =>
      _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomTextFormField(
      controller: widget.controller,
      label: widget.label.tr(),
      hintText: widget.hintText.tr(),
      keyboardType: TextInputType.text,
      textInputAction: widget.action ?? TextInputAction.done,
      prefixIcon: Icon(
        Icons.password,
        color: colorScheme.primary,
      ),
      validator: widget.validator ?? Validators.passwordValidator,
      obscureText: isHidden,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => isHidden = !isHidden),
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}