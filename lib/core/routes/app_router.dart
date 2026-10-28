import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/splash_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/upload_photo_screen.dart';
import 'package:flowery_e_commerce/features/auth/presentation/screens/verify_password_screen.dart';
import 'package:flowery_e_commerce/features/main_layout.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    GoRoute(
      path: '/splash',
      name: RoutesNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: RoutesNames.login,
      path: '/login',
      builder: (context, state) =>  LoginScreen(),
    ),
    GoRoute(
      name: RoutesNames.signup,
      path: '/signup',
      builder: (context, state) =>  SignUpScreen(),
    ),

    GoRoute(
      name: RoutesNames.home,
      path: '/home',
      builder: (context, state) => const MainLayout(),
    ),
    GoRoute(
      name: RoutesNames.forgetPassword,
      path: '/forgetPassword',
      builder: (context, state) =>  ForgetPasswordScreen(),
    ),

    GoRoute(
      name: RoutesNames.verifyPassword,
      path: '/verifyPassword',
      builder: (context, state) =>  VerifyPasswordScreen(),
    ),
    GoRoute(
      name: RoutesNames.resetPassword,
      path: '/resetPassword',
      builder: (context, state) =>  ResetPasswordScreen(),
    ),

    GoRoute(
      name: RoutesNames.uploadPhoto,
      path: '/uploadPhoto',
      builder: (context, state) => const UploadPhotoScreen(),
    )
  ],
);