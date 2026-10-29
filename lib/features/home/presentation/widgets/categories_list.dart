import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_state.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/category_item.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/category_item_skeleton.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.setHeight(104)),
        CategoriesSectionHeader(title: 'categories'),

        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final isInitialLoading =
                state.getHomeContentState.isLoading && state.categories.isEmpty;

            if (state.getHomeContentState.error != null &&
                state.categories.isEmpty) {
              return Center(child: Text('error'.tr()));
            }

            if (isInitialLoading) {
              return CustomShimmer(
                child: SizedBox(
                  height: context.setHeight(140),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (_, __) => const CategoryItemSkeleton(),
                  ),
                ),
              );
            }

            if (state.categories.isEmpty) {
              return Center(child: Text('noCategoriesFound'.tr()));
            }

            final categories = state.categories;

            return SizedBox(
              height: context.setHeight(140),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  if (index >= categories.length) {
                    return CustomShimmer(child: const CategoryItemSkeleton());
                  }
                  return CategoryItem(category: categories[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
