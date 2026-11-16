import 'package:flowery_e_commerce/core/widgets/error_view.dart';
import 'package:flowery_e_commerce/core/widgets/products_list_loading.dart';
import 'package:flowery_e_commerce/features/search/presentation/widgets/search_empty_view.dart';
import 'package:flowery_e_commerce/features/search/presentation/widgets/search_results_grid.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_bloc.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_state.dart';
import 'package:flowery_e_commerce/features/search/presentation/widgets/search_initial_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.setWidth(16),
      ),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.keyword.trim().isEmpty) {
            return const SearchInitialView();
          }

          if (state.searchStatus.isLoading) {
            return const ProductsListLoading();
          }

          if (state.searchStatus.isFailure) {
            return ErrorView(
              errorMessage:
              state.searchStatus.error!.messageKey.tr(),
            );
          }

          final products = state.searchStatus.data ?? [];

          if (products.isEmpty) {
            return SearchEmptyView(
            );
          }

          return SearchResultsGrid(products: products);
        },
      ),
    );
  }
}
