import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/widgets/custom_tabs.dart';
import 'package:flowery_e_commerce/core/widgets/custom_tabs_skeleton.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesContent extends StatelessWidget {
  final String? selectedCategoryId;

  const CategoriesContent({this.selectedCategoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        final productsState = state.getAllProductsState;
        final categoriesState = state.getAllCategoriesState;

        if (productsState.isLoading || categoriesState.isLoading) {
          return CustomShimmer(child: CustomTabsSkeleton());
        }

        if (productsState.isFailure || categoriesState.isFailure) {
          return Center(child: Text('error'.tr()));
        }

        // Data
        final products = productsState.data ?? [];
        final categories = categoriesState.data ?? [];

        // Tabs: All + Categories
        final tabs = [
          'all'.tr(),
          ...categories.map((category) => category.name ?? ''),
        ];

        // Find selected category
        final categoryIndex = categories.indexWhere(
          (category) => category.id == selectedCategoryId,
        );

        // Add 1 because All is the first tab
        final initialTabIndex = categoryIndex >= 0 ? categoryIndex + 1 : 0;

        return CustomTabs(
          key: ValueKey(selectedCategoryId),
          tabs: tabs,
          initialIndex: initialTabIndex,
          getProducts: (index) {
            if (index == 0) return products;

            final category = categories[index - 1];

            return products.where((product) {
              return product.category == category.id;
            }).toList();
          },
        );
      },
    );
  }
}
