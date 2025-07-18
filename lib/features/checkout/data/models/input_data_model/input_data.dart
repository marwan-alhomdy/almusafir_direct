class InputData {
  int? departmentsId;
  dynamic userId;
  dynamic email;
  dynamic customerId;
  int? stateId;
  String? customerNotes;
  String? fromAddress1;
  String? step;
  String? fromCountry;
  String? fromState;
  String? fromLat;
  String? fromLng;
  String? shippingAddress1;
  String? shippingCountry;
  String? shippingState;
  String? shippingLat;
  String? shippingLng;
  String? orderType22;
  String? vehicleTypeId;
  String? vehicleTypeRefType;
  String? shippingFirstname;
  String? shippingLastname;
  String? orderDate22;
  String? fromPhone;
  String? shippingAddressId22;
  String? loadPeople;
  String? tipAmount;
  String? shippingMethodId22;
  String? paymentMethodId;
  String? payStep2;
  String? confirmCode;
  String? couponCode;

  InputData({
    this.departmentsId,
    this.userId,
    this.email,
    this.customerId,
    this.stateId,
    this.customerNotes,
    this.fromAddress1,
    this.step,
    this.fromCountry,
    this.fromState,
    this.fromLat,
    this.fromLng,
    this.shippingAddress1,
    this.shippingCountry,
    this.shippingState,
    this.shippingLat,
    this.shippingLng,
    this.orderType22,
    this.vehicleTypeId,
    this.vehicleTypeRefType,
    this.shippingFirstname,
    this.shippingLastname,
    this.orderDate22,
    this.fromPhone,
    this.shippingAddressId22,
    this.loadPeople,
    this.tipAmount,
    this.shippingMethodId22,
    this.paymentMethodId,
    this.payStep2,
    this.confirmCode,
    this.couponCode,
  });

  factory InputData.fromJson(Map<String, dynamic> json) => InputData(
        departmentsId: json['departments_id'] as int?,
        userId: json['user_id'] as dynamic,
        email: json['email'] as dynamic,
        customerId: json['customer_id'] as dynamic,
        stateId: json['state_id'] as int?,
        customerNotes: json['customer_notes'] as String?,
        fromAddress1: json['from_address_1'] as String?,
        step: json['step'] as String?,
        fromCountry: json['from_country'] as String?,
        fromState: json['from_state'] as String?,
        fromLat: json['from_lat'] as String?,
        fromLng: json['from_lng'] as String?,
        shippingAddress1: json['shipping_address_1'] as String?,
        shippingCountry: json['shipping_country'] as String?,
        shippingState: json['shipping_state'] as String?,
        shippingLat: json['shipping_lat'] as String?,
        shippingLng: json['shipping_lng'] as String?,
        orderType22: json['order_type22'] as String?,
        vehicleTypeId: json['vehicle_type_id'] as String?,
        vehicleTypeRefType: json['vehicle_type_ref_type'] as String?,
        shippingFirstname: json['shipping_firstname'] as String?,
        shippingLastname: json['shipping_lastname'] as String?,
        orderDate22: json['order_date22'] as String?,
        fromPhone: json['from_phone'] as String?,
        shippingAddressId22: json['shipping_address_id22'] as String?,
        loadPeople: json['load_people'] as String?,
        tipAmount: json['tip_amount'] as String?,
        shippingMethodId22: json['shipping_method_id22'] as String?,
        paymentMethodId: json['payment_method_id'] as String?,
        payStep2: json['pay_step2'] as String?,
        confirmCode: json['confirm_code'] as String?,
        couponCode: json['coupon_code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'departments_id': departmentsId,
        'user_id': userId,
        'email': email,
        'customer_id': customerId,
        'state_id': stateId,
        'customer_notes': customerNotes,
        'from_address_1': fromAddress1,
        'step': step,
        'from_country': fromCountry,
        'from_state': fromState,
        'from_lat': fromLat,
        'from_lng': fromLng,
        'shipping_address_1': shippingAddress1,
        'shipping_country': shippingCountry,
        'shipping_state': shippingState,
        'shipping_lat': shippingLat,
        'shipping_lng': shippingLng,
        'order_type22': orderType22,
        'vehicle_type_id': vehicleTypeId,
        'vehicle_type_ref_type': vehicleTypeRefType,
        'shipping_firstname': shippingFirstname,
        'shipping_lastname': shippingLastname,
        'order_date22': orderDate22,
        'from_phone': fromPhone,
        'shipping_address_id22': shippingAddressId22,
        'load_people': loadPeople,
        'tip_amount': tipAmount,
        'shipping_method_id22': shippingMethodId22,
        'payment_method_id': paymentMethodId,
        'pay_step2': payStep2,
        'confirm_code': confirmCode,
        'coupon_code': couponCode,
      };
}
