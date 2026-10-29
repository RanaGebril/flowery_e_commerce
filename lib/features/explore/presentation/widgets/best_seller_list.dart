import 'package:flowery_e_commerce/features/explore/presentation/widgets/header_section.dart';
import 'package:flutter/material.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesSectionHeader(title: 'bestSeller'),
      ],
    );
  }
}
