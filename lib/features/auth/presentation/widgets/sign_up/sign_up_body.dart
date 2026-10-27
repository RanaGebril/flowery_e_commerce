import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/widgets/loader.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/sign_up/sign_up_footer.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.signUpState.isSuccess) {
          context.pushReplacementNamed(RoutesNames.home);
        }
        if (state.signUpState.isFailure) {
          Loaders.showErrorMessage(
            message: state.signUpState.error?.serverMessage ?? "",
            context: context,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.setWidth(16)),
        child: Column(
          children: [
            const SignUpForm(),
            SizedBox(height: context.setHeight(16)),
            const SignUpFooter(),
          ],
        ),
      ),
    );
  }
}
