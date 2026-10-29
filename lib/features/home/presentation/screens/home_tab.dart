import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_event.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/best_seller_list.dart';
import 'package:flowery_e_commerce/features/home/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(GetHomeContentEvent()),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CategoriesList(), BestSellerList()],
        ),
      ),
    );
  }
}
