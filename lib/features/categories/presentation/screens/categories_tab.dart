import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/custom_tabs.dart';
import 'package:flowery_e_commerce/core/widgets/custom_tabs_skeleton.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoriesTab extends StatelessWidget {
  final String? selectedCategoryId;

  const CategoriesTab({this.selectedCategoryId, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (_) => getIt<CategoriesBloc>()
        ..add(GetAllProductsEvent())
        ..add(GetAllCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(toolbarHeight: context.setHeight(70),title:   Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: context.setWidth(270),
                height: context.setHeight(50),
                padding: EdgeInsetsGeometry.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(context.setRadius(8)),
                  border: BoxBorder.all(
                    color: colorScheme.onPrimary,
                    width: context.setWidth(1),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: context.setWidth(5),
                        end: context.setWidth(10),
                      ),
                      child: Icon(Icons.search, color: colorScheme.onPrimary),
                    ),
                    Text(
                      'search'.tr(),
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: context.setWidth(64),
                height: context.setHeight(50),
                padding: EdgeInsetsGeometry.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(context.setRadius(8)),
                  border: BoxBorder.all(
                    color: colorScheme.onPrimary,
                    width: context.setWidth(1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: context.setWidth(5),
                    end: context.setWidth(10),
                  ),
                  child:  Icon(Icons.sort, color: colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            final productsState = state.getAllProductsState;
            final categoriesState = state.getAllCategoriesState;

            if (productsState.isLoading || categoriesState.isLoading) {
              return CustomShimmer(child: CustomTabsSkeleton());
            }
            //
            // // Failure
            // if (productsState.isFailure || categoriesState.isFailure) {
            //   return const Center(child: Text('Something went wrong'));
            // }

            // Data
            final products = productsState.data ?? [];
            final categories = categoriesState.data ?? [];
            //
            // if (products.isEmpty) {
            //   return Center(child: Text('noProductsFound'.tr()));
            // }

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
                // All products
                if (index == 0) {
                  return products;
                }

                // Selected category products
                final category = categories[index - 1];

                return products.where((product) {
                  return product.category == category.id;
                }).toList();
              },
            );
          },
        ),
      ),
    );
  }
}
