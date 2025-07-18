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
  static const String referral = "referral/alias/me";

  static const String points = "gamify/points";
  static const String statisticalPoints = 'gamify/points/statistical';

  static const String getAllDate =
      "data/all?exclude_item=tags_types,menus,categories,products";

  static const String checkout2 = "shop/checkout2";
  static const String paymentMethodsChechout = ' shop/checkout2/paymentmethods';
  static const String airport = "deliverys/airports";
  static const String vehicletypes = "deliverys/vehicletypes";
  static const String loadtypes = "orders/loadtypes";
  static const String paymentMethods = 'orders/paymentmethods';

  static const String flights = 'deliverys/flights';

  static const String tagsTypes = 'tags/types';
  static const String basicDepartments = 'basic/departments';
  static const String shopProducts = "shop/products";

  //cart
  static const String card = "shop/carts";
  static const String addCard = "shop/carts/add";
  static const String destroyAllCard = "shop/carts/destroy/all";

  //order
  static const String customerOrders =
      'orders/orders?include=department,order_types,items,totals,payment_method,shipping_method,user,delivery_user';

  static const chatWithGPT = 'chat/completions';

  //Favorite
  static const favoriteToggle = 'favorites/favorites/toggle';
  //Rating
  static const ratingToggle = 'reviews/reviews/toggle';
}
