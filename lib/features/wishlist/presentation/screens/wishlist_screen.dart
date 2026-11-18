import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/widgets/wishlist_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => getIt<WishlistBloc>()..add(GetWishlistEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('myWishlist'.tr(), style: textTheme.headlineLarge),
              Text('wishlistSubtitle'.tr(), style: textTheme.headlineSmall),
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: WishlistBody()
      ),
    );
  }
}
