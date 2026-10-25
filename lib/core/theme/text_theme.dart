import 'package:flowery_e_commerce/core/constants/text_constants.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyles {

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: TextConstants.inter,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: TextConstants.inter,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: TextConstants.inter,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: TextConstants.inter,
  );

  static const TextStyle displaySmall =TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    fontFamily: TextConstants.inter,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: TextConstants.inter,
  );



  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: TextConstants.inter,
    decoration: TextDecoration.underline

  );



  static const TextStyle titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: TextConstants.inter,
  );







  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: TextConstants.inter,
  );
}
