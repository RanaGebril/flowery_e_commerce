import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTab extends StatelessWidget {
  final String? selectedCategoryId;

  const CategoriesTab({this.selectedCategoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesBloc>()
        ..add(GetAllProductsEvent())
        ..add(GetAllCategoriesEvent()),
      child: CategoriesView(selectedCategoryId: selectedCategoryId)
    );
  }
}



