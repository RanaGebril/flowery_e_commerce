import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/validator_constants.dart';

abstract interface class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'emailValidation1'.tr();
    }
    if (!ValidatorConstants.emailRegex.hasMatch(value.trim())) {
      return 'emailValidation2'.tr();
    }
    return null;
  }
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordValidation1'.tr();
    }
    if (!ValidatorConstants.passwordMinLengthRegex.hasMatch(value)) {
      return 'passwordValidation2'.tr();
    }
    if (ValidatorConstants.passwordSpacesRegex.hasMatch(value)) {
      return 'passwordValidation3'.tr();
    }
    if (!ValidatorConstants.passwordNumberRegex.hasMatch(value)) {
      return 'passwordValidation4'.tr();
    }
    if (!ValidatorConstants.passwordMaxLengthRegex.hasMatch(value)) {
      return 'passwordValidation5'.tr();
    }
    if (!ValidatorConstants.passwordUppercaseRegex.hasMatch(value)) {
      return 'passwordValidation6'.tr();
    }
    if (!ValidatorConstants.passwordSpecialCharacterRegex
        .hasMatch(value)) {
      return 'passwordValidation7'.tr();
    }
    if (!ValidatorConstants.passwordLowercaseRegex.hasMatch(value)) {
      return 'passwordValidation8'.tr();
    }
    return null;
  }
}