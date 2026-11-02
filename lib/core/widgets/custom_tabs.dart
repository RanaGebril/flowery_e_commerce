import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/widgets/product_card.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  final List<String> tabs;
  final List<ProductEntity> Function(int index) getProducts;
  final int? initialIndex;

  const CustomTabs({
    super.key,
    required this.tabs,
    required this.getProducts,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex ?? 0,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: colorScheme.primary,
            unselectedLabelColor: colorScheme.onSurfaceVariant,
            labelStyle: textTheme.bodyLarge,
            unselectedLabelStyle: textTheme.bodyLarge,
            indicatorColor: colorScheme.primary,
            indicatorWeight: context.setWidth(3),
            indicatorSize: TabBarIndicatorSize.label,
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(
              horizontal: context.setWidth(12),
            ),
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),

          Expanded(
            child: TabBarView(
              children: List.generate(tabs.length, (index) {
                final products = getProducts(index);

                if (products.isEmpty) {
                  return Center(child: Text('noProductsFound'.tr()));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.63,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
