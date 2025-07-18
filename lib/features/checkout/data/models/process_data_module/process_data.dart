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
  int? isLoadLiter;
  int? isLoadStorageSensitive;
  int? isLoadFragileMaterials;
  dynamic weight;
  dynamic length;
  dynamic width;
  dynamic height;

  String? shippingFirstname;
  String? shippingLastname;
  String? shippingCountry;

  String? shippingState;
  String? shippingAddress1;
  num? shippingLat;
  num? shippingLng;
  String? shippingPhone;
  String? shippingEmail;
  String? shippingAddress2;
  String? shippingLines;
  String? shippingCity;
  String? shippingZip;
  String? shippingPostcode;
  String? shippingRadius;

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
  num? billingLat;
  num? billingLng;
  dynamic billingZip;
  dynamic billingPostcode;
  bool? billingDiffers;
  String? fromPhone;
  int? fromCountry;
  String? fromState;
  String? fromAddress1;
  num? fromLat;
  num? fromLng;
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
        cartTotal: json['cart_total'],
        departmentsId: json['departments_id'],
        userId: json['user_id'],
        email: json['email'],
        customerId: json['customer_id'],
        stateId: json['state_id'],
        customerNotes: json['customer_notes'],
        loadRefType: json['load_ref_type'],
        loadTypeId: json['load_type_id'],
        loadNotes: json['load_notes'],

        isLoadLiter: json['is_load_liter'],
        isLoadStorageSensitive: json['is_load_storage_sensitive'],
        isLoadFragileMaterials: json['is_load_fragile_materials'],
        weight: json['weight'],
        length: json['length'],
        width: json['width'],
        height: json['height'],

        shippingFirstname: json['shipping_firstname'],
        shippingLastname: json['shipping_lastname'],
        shippingCountry: json['shipping_country'],

        shippingState: json['shipping_state'],
        shippingAddress1: json['shipping_address_1'],

        shippingLat: json['shipping_lat'],
        shippingLng: json['shipping_lng'],

        shippingPhone: json['shipping_phone'],

        shippingEmail: json['shipping_email'],
        shippingAddress2: json['shipping_address_2'],
        shippingLines: json['shipping_lines'],
        shippingCity: json['shipping_city'],

        shippingZip: json['shipping_zip'],
        shippingPostcode: json['shipping_postcode'],
        // shippingRadius: json['shipping_radius'],

        billingAddressId: json['billing_address_id'],
        billingCompany: json['billing_company'],
        billingFirstname: json['billing_firstname'],
        billingLastname: json['billing_lastname'],
        billingEmail: json['billing_email'],
        billingPhone: json['billing_phone'],
        // billingCountry: json['billing_country'],
        billingState: json['billing_state'],
        billingCity: json['billing_city'],
        billingAddress1: json['billing_address_1'],
        billingAddress2: json['billing_address_2'],
        billingLines: json['billing_lines'],
        billingLat: json['billing_lat'],
        billingLng: json['billing_lng'],
        billingZip: json['billing_zip'],
        billingPostcode: json['billing_postcode'],
        billingDiffers: json['billing_differs'],
        fromPhone: json['from_phone'],
        // fromCountry: json['from_country'],
        fromState: json['from_state'],
        fromAddress1: json['from_address_1'],
        fromLat: json['from_lat'],
        fromLng: json['from_lng'],
        image: json['image'],
        image2: json['image2'],
        image3: json['image3'],
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
