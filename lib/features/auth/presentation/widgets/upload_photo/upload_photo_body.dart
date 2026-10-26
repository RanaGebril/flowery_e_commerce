import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import 'package:flowery_e_commerce/core/widgets/profile_photo_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UploadPhotoBody extends StatelessWidget {
  const UploadPhotoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.setWidth(24)),
        child: Column(
          children: [
            SizedBox(height: context.setHeight(24)),
            Text(
              'uploadPhotoHeadline'.tr(),
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.setHeight(8)),
            Text(
              'uploadPhotoSubtitle'.tr(),
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.setHeight(40)),

            BlocBuilder<SignUpBloc, SignUpState>(
              buildWhen: (previous, current) =>
              previous.photo != current.photo,
              builder: (context, state) {
                return Column(
                  children: [
                    ProfilePhotoPicker(
                      photo: state.photo,
                      onChanged: (file) => context
                          .read<SignUpBloc>()
                          .add(UpdateProfilePhotoEvent(file)),
                    ),
                    SizedBox(height: context.setHeight(48)),
                    CustomElevatedButton(
                      buttonTitle:
                      state.photo != null ? 'continue'.tr() : 'skip'.tr(),
                      onPressed: () {
                        if (state.photo != null) {
                          // TODO: upload the photo here (add your upload event),
                          // then navigate after it succeeds.
                        }
                        context.pushReplacementNamed(RoutesNames.home);
                      },
                    ),

                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}