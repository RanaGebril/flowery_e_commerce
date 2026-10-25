
abstract interface class ValidatorConstants {
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Password validation
  static final RegExp passwordMinLengthRegex = RegExp(r'^.{8,}$');
  static final RegExp passwordMaxLengthRegex = RegExp(r'^.{0,20}$');
  static final RegExp passwordSpacesRegex = RegExp(r'\s');
  static final RegExp passwordNumberRegex = RegExp(r'\d');
  static final RegExp passwordUppercaseRegex = RegExp(r'[A-Z]');
  static final RegExp passwordLowercaseRegex = RegExp(r'[a-z]');
  static final RegExp passwordSpecialCharacterRegex = RegExp(
    r'[!@#$%^&*(),.?":{}|<>_\-+=/\\[\]~`]',
  );


  static final RegExp nameRegex = RegExp(
    r"^[a-zA-Z\u0600-\u06FF]+(?:[ '-][a-zA-Z\u0600-\u06FF]+)*$",
  );

  static final RegExp phoneRegex = RegExp(
    r'^(?:\+20|0020|0)?1[0125][0-9]{8}$',
  );

}
