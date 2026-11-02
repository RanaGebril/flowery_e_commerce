import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/widgets/custom_tabs.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OccasionsScreen extends StatelessWidget {
  final String? selectedOccasionId;
  const OccasionsScreen({this.selectedOccasionId, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back_ios, color: colorScheme.onSurface),
        ),
        centerTitle: false,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('occasion'.tr(), style: textTheme.headlineLarge),
            Text('abbBarSubTitle'.tr(), style: textTheme.headlineSmall),
          ],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final selectedIndex = state.occasions.indexWhere(
            (occasion) => occasion.id == selectedOccasionId,
          );
          return CustomTabs(
            tabs: state.occasions
                .map((occasion) => occasion.name ?? '')
                .toList(),
            initialIndex: selectedIndex == -1 ? 0 : selectedIndex,
            getProducts: (index) {
              final occasion = state.occasions[index];

              return state.bestSeller.where((product) {
                return product.occasion == occasion.id;
              }).toList();
            },
          );
        },
      ),
    );
  }
}
