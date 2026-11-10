import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/custom_elevated_btn.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SortButton extends StatelessWidget {
  final String sortOption;
  const SortButton({required this.sortOption, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return CustomElevatedButton(
      onPressed: () {
        context.pop();
        context.read<CategoriesBloc>().add(SortProductsEvent(sortOption));
      },
      isText: false,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'sort'.tr(),
            style: textTheme.bodyLarge?.copyWith(color: colorScheme.surface),
          ),
          SizedBox(width: context.setWidth(10)),
          Icon(
            Icons.filter_list_rounded,
            size: context.setMinSize(25),
            color: colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
