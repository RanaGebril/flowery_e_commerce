import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/app_icons.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
            fontSize: 20,
            color: colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: context.setWidth(10)),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: context.setWidth(220),
            height: context.setHeight(40),
            padding: EdgeInsetsGeometry.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(context.setRadius(8)),
              border: BoxBorder.all(
                color: colorScheme.onPrimary,
                width: context.setWidth(1),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: context.setWidth(5),
                    end: context.setWidth(10),
                  ),
                  child: Icon(Icons.search, color: colorScheme.onPrimary),
                ),
                Text(
                  'search'.tr(),
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
