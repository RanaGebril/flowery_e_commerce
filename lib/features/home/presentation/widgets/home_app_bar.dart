import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/app_icons.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/widgets/custom_outlined_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: context.setWidth(30),
              height: context.setHeight(30),
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
            SvgPicture.asset(
              AppIcons.logo,
              width: context.setWidth(18),
              height: context.setHeight(18),
              fit: BoxFit.contain,
            ),
          ],
        ),
        Text(
          'appName'.tr(),
          style: GoogleFonts.imFellEnglish(
            fontSize: 25,
            color: colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
        Spacer(),
        CustomOutlinedIconButton(
          icon: Icons.search,
          onPressed: () {
            context.pushNamed(RoutesNames.search);
          },
        ),

        SizedBox(width: context.setWidth(8)),

        CustomOutlinedIconButton(
          icon: Icons.favorite,
          onPressed: () {
            context.pushNamed(RoutesNames.wishlist);
          },
        ),
      ],
    );
  }
}
