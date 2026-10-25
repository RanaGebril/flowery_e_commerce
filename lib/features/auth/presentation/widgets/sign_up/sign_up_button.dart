import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_state.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, bool>(
      selector: (state) => state.signUpState.isLoading,
      builder: (context, isLoading) {
        return CustomElevatedButton(
          buttonTitle: 'signup'.tr(),
          isLoading: isLoading,
          onPressed: onPressed,
        );
      },
    );
  }
}
