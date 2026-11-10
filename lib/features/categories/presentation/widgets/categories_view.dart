import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/categories_app_bar.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/categories_content.dart';
import 'package:flowery_e_commerce/features/categories/presentation/widgets/sort/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  final String? selectedCategoryId;

  const CategoriesView({required this.selectedCategoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.setHeight(70),
        title: const CategoriesAppBar(),
      ),
      body: CategoriesContent(selectedCategoryId: selectedCategoryId),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => _showSortBottomSheet(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('sort'.tr()),
            SizedBox(width: context.setWidth(10)),
            const Icon(Icons.filter_list_rounded),
          ],
        ),
      ),
    );
  }

  Future<void> _showSortBottomSheet(BuildContext context) async {
    await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<CategoriesBloc>(),
          child: const SortBottomSheet(),
        );
      },
    );
  }
}
