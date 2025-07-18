import '../cart_data_modele/cart_data.dart';

class ProcessData {
  CartData? cartData;
  int? cartTotal;
  int? departmentsId;
  int? userId;
  String? email;
  int? customerId;
  int? stateId;
  String? customerNotes;
  dynamic loadRefType;
  dynamic loadTypeId;
  dynamic loadNotes;
  bool? isLoadLiter;
  int? isLoadStorageSensitive;
  int? isLoadFragileMaterials;
  dynamic weight;
  dynamic length;
  dynamic width;
  dynamic height;
  String? shippingFirstname;
  String? shippingLastname;
  int? shippingCountry;
  String? shippingState;
  String? shippingAddress1;
  String? shippingLat;
  String? shippingLng;
  String? shippingPhone;
  String? shippingEmail;
  dynamic shippingAddress2;
  dynamic shippingLines;
  dynamic shippingCity;
  dynamic shippingZip;
  dynamic shippingPostcode;
  int? shippingRadius;
  dynamic billingAddressId;
  dynamic billingCompany;
  String? billingFirstname;
  String? billingLastname;
  String? billingEmail;
  String? billingPhone;
  int? billingCountry;
  String? billingState;
  dynamic billingCity;
  String? billingAddress1;
  dynamic billingAddress2;
  dynamic billingLines;
  String? billingLat;
  String? billingLng;
  dynamic billingZip;
  dynamic billingPostcode;
  bool? billingDiffers;
  String? fromPhone;
  int? fromCountry;
  String? fromState;
  String? fromAddress1;
  String? fromLat;
  String? fromLng;
  dynamic image;
  dynamic image2;
  dynamic image3;

  ProcessData({
    this.cartData,
    this.cartTotal,
    this.departmentsId,
    this.userId,
    this.email,
    this.customerId,
    this.stateId,
    this.customerNotes,
    this.loadRefType,
    this.loadTypeId,
    this.loadNotes,
    this.isLoadLiter,
    this.isLoadStorageSensitive,
    this.isLoadFragileMaterials,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.shippingFirstname,
    this.shippingLastname,
    this.shippingCountry,
    this.shippingState,
    this.shippingAddress1,
    this.shippingLat,
    this.shippingLng,
    this.shippingPhone,
    this.shippingEmail,
    this.shippingAddress2,
    this.shippingLines,
    this.shippingCity,
    this.shippingZip,
    this.shippingPostcode,
    this.shippingRadius,
    this.billingAddressId,
    this.billingCompany,
    this.billingFirstname,
    this.billingLastname,
    this.billingEmail,
    this.billingPhone,
    this.billingCountry,
    this.billingState,
    this.billingCity,
    this.billingAddress1,
    this.billingAddress2,
    this.billingLines,
    this.billingLat,
    this.billingLng,
    this.billingZip,
    this.billingPostcode,
    this.billingDiffers,
    this.fromPhone,
    this.fromCountry,
    this.fromState,
    this.fromAddress1,
    this.fromLat,
    this.fromLng,
    this.image,
    this.image2,
    this.image3,
  });

  factory ProcessData.fromJson(Map<String, dynamic> json) => ProcessData(
        cartData: json['cart_data'] == null
            ? null
            : CartData.fromJson(json['cart_data'] as Map<String, dynamic>),
        cartTotal: json['cart_total'] as int?,
        departmentsId: json['departments_id'] as int?,
        userId: json['user_id'] as int?,
        email: json['email'] as String?,
        customerId: json['customer_id'] as int?,
        stateId: json['state_id'] as int?,
        customerNotes: json['customer_notes'] as String?,
        loadRefType: json['load_ref_type'] as dynamic,
        loadTypeId: json['load_type_id'] as dynamic,
        loadNotes: json['load_notes'] as dynamic,
        isLoadLiter: json['is_load_liter'] as bool?,
        isLoadStorageSensitive: json['is_load_storage_sensitive'] as int?,
        isLoadFragileMaterials: json['is_load_fragile_materials'] as int?,
        weight: json['weight'] as dynamic,
        length: json['length'] as dynamic,
        width: json['width'] as dynamic,
        height: json['height'] as dynamic,
        shippingFirstname: json['shipping_firstname'] as String?,
        shippingLastname: json['shipping_lastname'] as String?,
        shippingCountry: json['shipping_country'] as int?,
        shippingState: json['shipping_state'] as String?,
        shippingAddress1: json['shipping_address_1'] as String?,
        shippingLat: json['shipping_lat'] as String?,
        shippingLng: json['shipping_lng'] as String?,
        shippingPhone: json['shipping_phone'] as String?,
        shippingEmail: json['shipping_email'] as String?,
        shippingAddress2: json['shipping_address_2'] as dynamic,
        shippingLines: json['shipping_lines'] as dynamic,
        shippingCity: json['shipping_city'] as dynamic,
        shippingZip: json['shipping_zip'] as dynamic,
        shippingPostcode: json['shipping_postcode'] as dynamic,
        shippingRadius: json['shipping_radius'] as int?,
        billingAddressId: json['billing_address_id'] as dynamic,
        billingCompany: json['billing_company'] as dynamic,
        billingFirstname: json['billing_firstname'] as String?,
        billingLastname: json['billing_lastname'] as String?,
        billingEmail: json['billing_email'] as String?,
        billingPhone: json['billing_phone'] as String?,
        billingCountry: json['billing_country'] as int?,
        billingState: json['billing_state'] as String?,
        billingCity: json['billing_city'] as dynamic,
        billingAddress1: json['billing_address_1'] as String?,
        billingAddress2: json['billing_address_2'] as dynamic,
        billingLines: json['billing_lines'] as dynamic,
        billingLat: json['billing_lat'] as String?,
        billingLng: json['billing_lng'] as String?,
        billingZip: json['billing_zip'] as dynamic,
        billingPostcode: json['billing_postcode'] as dynamic,
        billingDiffers: json['billing_differs'] as bool?,
        fromPhone: json['from_phone'] as String?,
        fromCountry: json['from_country'] as int?,
        fromState: json['from_state'] as String?,
        fromAddress1: json['from_address_1'] as String?,
        fromLat: json['from_lat'] as String?,
        fromLng: json['from_lng'] as String?,
        image: json['image'] as dynamic,
        image2: json['image2'] as dynamic,
        image3: json['image3'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'cart_data': cartData?.toJson(),
        'cart_total': cartTotal,
        'departments_id': departmentsId,
        'user_id': userId,
        'email': email,
        'customer_id': customerId,
        'state_id': stateId,
        'customer_notes': customerNotes,
        'load_ref_type': loadRefType,
        'load_type_id': loadTypeId,
        'load_notes': loadNotes,
        'is_load_liter': isLoadLiter,
        'is_load_storage_sensitive': isLoadStorageSensitive,
        'is_load_fragile_materials': isLoadFragileMaterials,
        'weight': weight,
        'length': length,
        'width': width,
        'height': height,
        'shipping_firstname': shippingFirstname,
        'shipping_lastname': shippingLastname,
        'shipping_country': shippingCountry,
        'shipping_state': shippingState,
        'shipping_address_1': shippingAddress1,
        'shipping_lat': shippingLat,
        'shipping_lng': shippingLng,
        'shipping_phone': shippingPhone,
        'shipping_email': shippingEmail,
        'shipping_address_2': shippingAddress2,
        'shipping_lines': shippingLines,
        'shipping_city': shippingCity,
        'shipping_zip': shippingZip,
        'shipping_postcode': shippingPostcode,
        'shipping_radius': shippingRadius,
        'billing_address_id': billingAddressId,
        'billing_company': billingCompany,
        'billing_firstname': billingFirstname,
        'billing_lastname': billingLastname,
        'billing_email': billingEmail,
        'billing_phone': billingPhone,
        'billing_country': billingCountry,
        'billing_state': billingState,
        'billing_city': billingCity,
        'billing_address_1': billingAddress1,
        'billing_address_2': billingAddress2,
        'billing_lines': billingLines,
        'billing_lat': billingLat,
        'billing_lng': billingLng,
        'billing_zip': billingZip,
        'billing_postcode': billingPostcode,
        'billing_differs': billingDiffers,
        'from_phone': fromPhone,
        'from_country': fromCountry,
        'from_state': fromState,
        'from_address_1': fromAddress1,
        'from_lat': fromLat,
        'from_lng': fromLng,
        'image': image,
        'image2': image2,
        'image3': image3,
      };
}
