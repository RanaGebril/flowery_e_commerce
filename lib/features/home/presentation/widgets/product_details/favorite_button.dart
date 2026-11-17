import 'package:flowery_e_commerce/core/constants/app_colors.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_event.dart';
import 'package:flowery_e_commerce/features/wishlist/presentation/bloc/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatefulWidget {
  final String productId;
  final bool inWishlist;

  const FavoriteButton({
    required this.inWishlist,
    required this.productId,
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.inWishlist;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;

    return BlocProvider(
      create: (context) => getIt<WishlistBloc>(),
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              //currently remove from wishlist is not working
              setState(() {
                isFavorite = !isFavorite;
              });
                context.read<WishlistBloc>().add(
                  AddToWishlistEvent(productId: widget.productId),
                );
            },
            child: Container(
              padding: EdgeInsets.all(context.setMinSize(8)),
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                shape: BoxShape.circle,
                border: Border.all(
                  width: context.setWidth(1),
                  color: AppColors.green,
                ),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: colorScheme.primary,
                size: 26,
              ),
            ),
          );
        },
      ),
    );
  }
}