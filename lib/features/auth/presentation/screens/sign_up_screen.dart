import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/widgets/sign_up/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("signup".tr()),
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_new)),),
        body: SingleChildScrollView(child: SignUpBody()
                ),
      ));
  }
}
