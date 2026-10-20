abstract final class EndpointsConstants {
  // auth
  static const String login = 'auth/signin';
  static const String register = 'auth/signup';
  static const String forgetPassword = 'auth/forgotPassword';
  static const String resendCode = 'auth/forgotPassword';
  static const String verification = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';
  static const String loggedUserData = 'auth/profile-data';
  static const String editProfile = 'auth/editProfile';
  static const String uploadProfileImage = 'auth/upload-photo';
  static const String profileResetPassword = 'auth/change-password';
  static const String logout = 'auth/logout';

  // catalog
  static const String home = 'home';
  static const String categories = 'categories';
  static const String products = 'products';

  // cart
  static const String cart = 'cart';
  static const String cartItem = 'cart/{productId}';

  // addresses
  static const String addresses = 'addresses';
  static const String addressById = 'addresses/{addressId}';

  // orders
  static const String orders = 'orders';
  static const String checkout = 'orders/checkout';
}