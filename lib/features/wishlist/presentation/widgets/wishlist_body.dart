import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/error_view.dart';
import 'package:flowery_e_commerce/core/widgets/products_list_loading.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_state.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/widgets/wishlist_empty_view.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/widgets/wishlist_results_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBody extends StatelessWidget {
  const WishlistBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(context.setHeight(16)),
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          final status = state.getWishlistStatus;

          if (status.isLoading) {
            return ProductsListLoading();
          }

          if (status.isFailure) {
            return ErrorView(
              errorMessage: state.getWishlistStatus.error!.messageKey.tr(),
            );
          }

          final wishlist = status.data?.wishlist?.products ?? [];

          if (wishlist.isEmpty) {
            return WishlistEmptyView();
          }

          return WishlistResultsGrid(products: wishlist);
        },
      ),
    );
  }
}
