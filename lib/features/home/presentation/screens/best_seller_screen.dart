import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/widgets/product_card.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorScheme.onSurface,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('bestSeller'.tr(), style: textTheme.headlineLarge),
            Text('bestSellerTitleBar'.tr(), style: textTheme.headlineSmall),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final bestSellers = state.bestSeller;

          if (bestSellers.isEmpty) {
            return const Center(
              child: Text('No products available'),
            );
          }

          return  GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bestSellers.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 250, // fixed height, no more dependence on screen width
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: bestSellers[index]);
            },
          );
        },
      ),
    );
  }
}
