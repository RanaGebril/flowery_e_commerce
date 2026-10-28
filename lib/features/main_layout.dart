import 'package:flowery_e_commerce/features/explore/presentation/screens/explore_tab.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExploreTab(),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: state.currentIndex,
        // onTap: (index) {
        //   context.read<MainLayoutCubit>().changeTab(index);
        // },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFCC1010),
        unselectedItemColor: const Color(0xFF535353),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
