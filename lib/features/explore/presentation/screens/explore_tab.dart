import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_bloc.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_event.dart';
import 'package:flowery_e_commerce/features/explore/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExploreBloc>()..add(GetCategoriesEvent()),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CategoriesList()],
        ),
      ),
    );
  }
}
