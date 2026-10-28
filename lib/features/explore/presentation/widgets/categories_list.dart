import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_event.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_state.dart';
import 'package:flowery_e_commerce/features/explore/presentation/widgets/category_item.dart';
import 'package:flowery_e_commerce/features/explore/presentation/widgets/category_item_skeleton.dart';
import 'package:flowery_e_commerce/features/explore/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 100) {
      context.read<ExploreBloc>().add(LoadMoreCategoriesEvent());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.setHeight(104)),
        CategoriesSectionHeader(title: 'categories'),

        BlocBuilder<ExploreBloc, ExploreState>(
          builder: (context, state) {
            final isInitialLoading =
                state.getCategoriesState.isLoading && state.categories.isEmpty;

            if (state.getCategoriesState.error != null &&
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
                controller: _controller,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                itemCount: categories.length + (state.isLoadingMore ? 3 : 0),
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
