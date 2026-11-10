import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_state.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/sort/sort_button.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/sort/sort_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  static const List<String> sortOptions = [
    'lowestPrice',
    'highestPrice',
    'newest',
    'oldest',
    'discount',
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: context.setWidth(16),
            vertical: context.setHeight(25),
          ),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(context.setRadius(32)),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'sortBy'.tr(),
                  style: textTheme.headlineLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                RadioGroup<int>(
                  groupValue: state.selectedSortIndex,
                  onChanged: (value) {
                    if (value == null) return;

                    context.read<CategoriesBloc>().add(
                      SelectSortOptionEvent(value),
                    );
                  },
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(4),
                      vertical: context.setHeight(16),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sortOptions.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: context.setHeight(16)),
                    itemBuilder: (context, index) {
                      return SortOptionItem(
                        title: sortOptions[index].tr(),
                        value: index,
                      );
                    },
                  ),
                ),

                SortButton(
                  sortOption: sortOptions[state.selectedSortIndex ?? 0],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
