import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        BlocSelector<LoginBloc, LoginState, bool>(
          selector: (state) => state.rememberMeCheck,
          builder: (context, checked) {
            return Checkbox(
              value: checked,
              onChanged: (value) => context.read<LoginBloc>().add(
                ToggleRememberMeEvent(isChecked: value!),
              ),
              activeColor: colorScheme.primary,
              hoverColor: Colors.transparent,
              checkColor: colorScheme.surface,
            );
          },
        ),
        Text("rememberMe".tr(), style: textTheme.bodySmall),
        const Spacer(),
        GestureDetector(
          onTap: () => context.pushNamed(RoutesNames.forgetPassword),
          child: Text("forgetPassword".tr(), style: textTheme.displaySmall),
        ),
      ],
    );
  }
}