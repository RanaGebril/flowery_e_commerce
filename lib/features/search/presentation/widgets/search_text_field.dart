import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_bloc.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() =>
      _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomTextFormField(
      controller: controller,
      hintText: 'search'.tr(),
      onChanged: (value) {
        context.read<SearchBloc>().add(
          SearchProductsEvent(keyword: value.trim()),
        );
      },
      prefixIcon: Icon(
        Icons.search,
        size: context.setMinSize(24),
        color: colorScheme.onPrimary,
      ),
      suffixIcon: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value.text.isEmpty) {
            return const SizedBox.shrink();
          }

          return IconButton(
            onPressed: () {
              controller.clear();
              context.read<SearchBloc>().add(
                ClearSearchEvent(),
              );
            },
            icon: Icon(
              Icons.cancel_outlined,
              size: context.setMinSize(24),
              color: colorScheme.onPrimary,
            ),
          );
        },
      ),
    );
  }
}
