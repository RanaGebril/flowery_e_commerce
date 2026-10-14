import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:go_router/go_router.dart';

import '../../test.dart';
final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: RoutesNames.login,
      path: '/login',
      builder: (context, state) => const Test(),
    ),

    // GoRoute(
    //   name: RoutesNames.home,
    //   path: '/home',
    //   // builder: (context, state) => const HomeScreen(),
    // ),
  ],
);