import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:flowery_e_commerce/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Text('genderLabel'.tr(), style: textTheme.headlineMedium),
        SizedBox(width: context.setWidth(10)),
        Expanded(
          child: BlocSelector<SignUpBloc, SignUpState, String>(
            selector: (state) => state.selectedGender,
            builder: (context, gender) {
              return RadioGroup<String>(
                groupValue: gender,
                onChanged: (value) {
                  if (value == null) return;

                  context.read<SignUpBloc>().add(
                    SelectGenderEvent(gender: value),
                  );
                },
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'female',
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return colorScheme.primary;
                        }
                        return colorScheme.onSecondary;
                      }),
                    ),
                    Text(
                      'genderFemaleDisplay'.tr(),
                      style: textTheme.bodyMedium,
                    ),
                    SizedBox(width: context.setWidth(20)),
                    Radio<String>(
                      value: 'male',
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return colorScheme.primary;
                        }
                        return colorScheme.onSecondary;
                      }),
                    ),
                    Text('genderMaleDisplay'.tr(), style: textTheme.bodyMedium),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
