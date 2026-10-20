import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flowery_e_commerce/features/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: RoutesNames.login,
      path: '/login',
      builder: (context, state) =>  LoginScreen(),
    ),
    GoRoute(
      name: RoutesNames.forgetPassword,
      path: '/forgetPassword',
      builder: (context, state) =>  ForgetPasswordScreen(),
    ),
    GoRoute(
      name: RoutesNames.signup,
      path: '/signup',
      builder: (context, state) =>  SignUpScreen(),
    ),

    GoRoute(
      name: RoutesNames.home,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);