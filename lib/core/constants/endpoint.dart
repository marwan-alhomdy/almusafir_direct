class EndPointName {
  static const String login = 'auth/login';
  static const String register = "auth/register";
  static const String sendOtp = 'auth/otp/send';
  static const String otpValidate = 'auth/otp/validate';

  static const String resendOtp = "resend-otp";
  static const String logout = 'auth/logout';
  static const String deleteAccount = 'auth/deleteaccount';

  static const String sendactivation = "auth/sendactivation";
  static const String checkActivation = "auth/checkactivation";

  static const String sendVerify = "auth/verify/send";
  static const String checkVerify = "auth/verify/check";

  static const String contactUs = "cms/contact-forms/add";

  static const String avatar = "me/avatar";
  static const String me = "me";

  static const String getAllDate =
      "data/all?exclude_item=tags_types,menus,categories,products";
}
