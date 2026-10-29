import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/shimmer_effect.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_state.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/best_seller_item.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/home_card_skeleton.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(title: 'bestSeller'),
        SizedBox(height: context.setHeight(10)),

        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final isLoading = state.getHomeContentState.isLoading;

            if (state.getHomeContentState.error != null &&
                state.categories.isEmpty) {
              return Center(child: Text('error'.tr()));
            }

            if (isLoading) {
              return CustomShimmer(
                child: SizedBox(
                  height: context.setHeight(220),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(16),
                    ),
                    itemCount: 5,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: context.setWidth(12)),
                    itemBuilder: (context, index) {
                      return const HomeCardSkeleton();
                    },
                  ),
                ),
              );
            }
            final bestSellers = state.bestSeller;

            return SizedBox(
              height: context.setHeight(220),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: context.setWidth(16)),
                itemCount: bestSellers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: context.setWidth(12),
                    ),
                    child: BestSellerItem(bestSeller: bestSellers[index]),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
