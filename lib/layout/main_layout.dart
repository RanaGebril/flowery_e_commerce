import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/categories/presentation/screens/categories_tab.dart';
import 'package:flowery_e_commerce/features/home/presentation/screens/home_tab.dart';
import 'package:flowery_e_commerce/layout/bloc/layout_bloc.dart';
import 'package:flowery_e_commerce/layout/bloc/layout_event.dart';
import 'package:flowery_e_commerce/layout/bloc/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => MainLayoutBloc(),
      child: BlocBuilder<MainLayoutBloc, MainLayoutState>(
        builder: (context, state) {
          final screens = [
            const HomeTab(),
            CategoriesTab(selectedCategoryId: state.selectedCategoryId),
          ];
          //   const FavoritesTab(),
          //   const ProfileTab(),
          // ];

          return Scaffold(
            body: IndexedStack(index: state.currentIndex, children: screens),
            bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
              selectedIconTheme: IconThemeData(
                size: context.setMinSize(25),
                color: colorScheme.primary,
              ),
              unselectedIconTheme: IconThemeData(
                size: context.setMinSize(25),
                color: colorScheme.onPrimary,
              ),
              selectedLabelStyle: textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
              ),
              unselectedLabelStyle: textTheme.bodySmall?.copyWith(
                color: colorScheme.onPrimary,
              ),
              currentIndex: state.currentIndex,
              onTap: (index) {
                context.read<MainLayoutBloc>().add(ChangeTabEvent(index));
              },
              type: BottomNavigationBarType.fixed,

              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'home'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  activeIcon: Icon(Icons.category),
                  label: 'categories'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: 'cart'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'profile'.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
