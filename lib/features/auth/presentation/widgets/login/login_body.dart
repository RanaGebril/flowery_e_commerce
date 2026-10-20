import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/widgets/loader.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_state.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/login_footer.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginStatus.isSuccess) {
          context.pushReplacementNamed(RoutesNames.home);
        }
        if (state.loginStatus.isFailure) {
          Loaders.showErrorMessage(
            message: state.loginStatus.error?.serverMessage ?? "",
            context: context,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.setWidth(16)),
        child: Column(
          children: [
            const LoginForm(),
            SizedBox(height: context.setHeight(16)),
            const LoginFooter(),
          ],
        ),
      ),
    );
  }
}
