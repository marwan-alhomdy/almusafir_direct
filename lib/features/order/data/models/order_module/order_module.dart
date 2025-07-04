import '../../../../../core/data/current_user/data.dart';
import '../../../../../core/data/models/department/data.dart';
import '../../../../../core/data/service.module.dart';
import '../../../../home/data/model/orderstypes/datum.dart';
import 'delivery_user.dart';
import 'items.dart';
import 'shipping_method.dart';
import 'totals.dart';

class OrderModule {
  num? id;
  String? orderType;
  String? orderTypeId;
  String? vehicleTypeId;
  String? vehicleTypeRefType;
  String? loadTypeId;
  String? loadRefType;
  String? loadNotes;
  num? loadPeople;
  num? weight;
  num? length;
  num? width;
  num? height;
  num? isLoadStorageSensitive;
  num? isLoadFragileMaterials;
  num? isLoadLiter;
  num? userId;
  num? customerId;
  String? email;
  num? orderStatesId;
  String? orderStatesRefType;
  String? userStatus;
  num? shippingMethodId;
  String? shippingMethodRefType;
  num? shippingAddressId;
  String? shippingCompany;
  String? shippingFirstname;
  String? shippingLastname;
  String? shippingPhone;
  String? shippingEmail;
  String? shippingCountry;
  String? shippingState;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingLines;
  String? shippingCity;
  String? shippingZip;
  String? shippingPostcode;
  double? shippingLat;
  double? shippingLng;
  num? shippingRadius;
  String? passportType;
  String? passportNumber;
  String? bookingNumber;
  String? flightNumber;
  String? departureDestination;
  String? arrivalDestination;
  num? isRoundTrip;
  num? billingDiffers;
  num? billingAddressId;
  String? billingCompany;
  String? billingFirstname;
  String? billingLastname;
  String? billingEmail;
  String? billingPhone;
  String? billingCountry;
  String? billingState;
  String? billingAddress1;
  String? billingAddress2;
  String? billingLines;
  String? billingCity;
  String? billingZip;
  String? billingPostcode;
  double? billingLat;
  double? billingLng;
  num? billingRadius;
  num? deliveryId;
  String? deliveryUserId;
  String? deliveryVehicleTypeId;
  String? deliveryVehicleTypeRefType;
  String? deliveryCarId;
  String? deliveryStatus;
  String? pickup;
  num? ordersRequestsId;
  num? assigneeId;
  num? paymentMethodId;
  String? paymentState;
  num? processed;
  String? paymentTransId;
  dynamic paymentFirstTransId;
  dynamic paymentRefundTransId;
  num? refundTotal;
  String? cardType;
  String? cardFirstName;
  String? cardLastName;
  String? cardNumber;
  String? cardExpiryMonth;
  String? cardExpiryYear;
  String? cardCvv;
  String? mainCurrencysId;
  String? currencysId;
  num? rate;
  String? distanceUnit;
  num? shippingPrice;
  double? shippingDistance;
  num? shippingCost;
  num? shippingDiscount;
  num? shippingTaxes;
  num? shippingTotal;
  num? tipAmount;
  num? plusAmount;
  String? plusNotes;
  num? minusAmount;
  String? minusNotes;
  num? expectedShippingTotal;
  num? subtotal;
  num? cartTotal;
  num? expectedCartTotal;
  num? orderDiscount;
  num? orderTaxes;
  num? orderTotal;
  num? expectedOrderTotal;
  num? isBrokerage;
  num? brokerageRate;
  num? brokerageTotal;
  num? isTransBrokerage;
  num? totalPaymentPreTaxes;
  num? totalPaymentTaxes;
  num? totalPaymentPostTaxes;
  String? orderDate;
  dynamic returnDate;
  String? deliveryAt;
  String? shippedAt;
  String? endDate;
  String? becauseCancel;
  String? deliveryBecauseCancel;
  String? customerNotes;
  String? adminNotes;
  String? trackingNumber;
  String? trackingUrl;
  String? ipAddress;
  String? userAgent;
  String? companysId;
  String? departmentsId;
  num? countryId;
  num? stateId;
  String? paperId;
  String? extendId;
  String? employeesId;
  dynamic otherData;
  dynamic configData;
  num? sortOrder;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  num? fromAddressId;
  String? fromCompany;
  String? fromFirstname;
  String? fromLastname;
  String? fromPhone;
  String? fromEmail;
  String? fromCountry;
  String? fromState;
  String? fromAddress1;
  String? fromAddress2;
  String? fromLines;
  String? fromCity;
  String? fromZip;
  String? fromPostcode;
  double? fromLat;
  double? fromLng;
  num? fromRadius;
  double? shippingToFromDistance;
  String? paymentStateName;
  String? orderStatesName;
  String? userStatusName;
  String? deliveryStatusName;
  int? isShowStatuesPicker;
  dynamic image;
  dynamic image2;
  dynamic image3;
  List<dynamic>? images;
  List<dynamic>? files;
  String? objectType;
  num? ratingsCount;
  num? countRating;
  num? sumRating;
  num? averageRating;
  num? userIsRating;
  dynamic userObjectRating;
  num? favoritesCount;
  num? userIsFavorite;
  num? likesCount;
  num? bookmarksCount;
  num? reactionsCount;
  Totals? totals;
  Items? items;
  ServiceModul? paymentMethod;
  ShoppingDepartment? department;
  OrderType? orderTypes;
  ShippingMethod? shippingMethod;
  User? user;
  DeliveryUser? deliveryUser;

  OrderModule({
    this.id,
    this.orderType,
    this.orderTypeId,
    this.vehicleTypeId,
    this.vehicleTypeRefType,
    this.loadTypeId,
    this.loadRefType,
    this.loadNotes,
    this.loadPeople,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.isLoadStorageSensitive,
    this.isLoadFragileMaterials,
    this.isLoadLiter,
    this.userId,
    this.customerId,
    this.email,
    this.orderStatesId,
    this.orderStatesRefType,
    this.userStatus,
    this.shippingMethodId,
    this.shippingMethodRefType,
    this.shippingAddressId,
    this.shippingCompany,
    this.shippingFirstname,
    this.shippingLastname,
    this.shippingPhone,
    this.shippingEmail,
    this.shippingCountry,
    this.shippingState,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingLines,
    this.shippingCity,
    this.shippingZip,
    this.shippingPostcode,
    this.shippingLat,
    this.shippingLng,
    this.shippingRadius,
    this.passportType,
    this.passportNumber,
    this.bookingNumber,
    this.flightNumber,
    this.departureDestination,
    this.arrivalDestination,
    this.isRoundTrip,
    this.billingDiffers,
    this.billingAddressId,
    this.billingCompany,
    this.billingFirstname,
    this.billingLastname,
    this.billingEmail,
    this.billingPhone,
    this.billingCountry,
    this.billingState,
    this.billingAddress1,
    this.billingAddress2,
    this.billingLines,
    this.billingCity,
    this.billingZip,
    this.billingPostcode,
    this.billingLat,
    this.billingLng,
    this.billingRadius,
    this.deliveryId,
    this.deliveryUserId,
    this.deliveryVehicleTypeId,
    this.deliveryVehicleTypeRefType,
    this.deliveryCarId,
    this.deliveryStatus,
    this.pickup,
    this.ordersRequestsId,
    this.assigneeId,
    this.paymentMethodId,
    this.paymentState,
    this.processed,
    this.paymentTransId,
    this.paymentFirstTransId,
    this.paymentRefundTransId,
    this.refundTotal,
    this.cardType,
    this.cardFirstName,
    this.cardLastName,
    this.cardNumber,
    this.cardExpiryMonth,
    this.cardExpiryYear,
    this.cardCvv,
    this.mainCurrencysId,
    this.currencysId,
    this.rate,
    this.distanceUnit,
    this.shippingPrice,
    this.shippingDistance,
    this.shippingCost,
    this.shippingDiscount,
    this.shippingTaxes,
    this.shippingTotal,
    this.tipAmount,
    this.plusAmount,
    this.plusNotes,
    this.minusAmount,
    this.minusNotes,
    this.expectedShippingTotal,
    this.subtotal,
    this.cartTotal,
    this.expectedCartTotal,
    this.orderDiscount,
    this.orderTaxes,
    this.orderTotal,
    this.expectedOrderTotal,
    this.isBrokerage,
    this.brokerageRate,
    this.brokerageTotal,
    this.isTransBrokerage,
    this.totalPaymentPreTaxes,
    this.totalPaymentTaxes,
    this.totalPaymentPostTaxes,
    this.orderDate,
    this.returnDate,
    this.deliveryAt,
    this.shippedAt,
    this.endDate,
    this.becauseCancel,
    this.deliveryBecauseCancel,
    this.customerNotes,
    this.adminNotes,
    this.trackingNumber,
    this.trackingUrl,
    this.ipAddress,
    this.userAgent,
    this.companysId,
    this.departmentsId,
    this.countryId,
    this.stateId,
    this.paperId,
    this.extendId,
    this.employeesId,
    this.otherData,
    this.configData,
    this.sortOrder,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fromAddressId,
    this.fromCompany,
    this.fromFirstname,
    this.fromLastname,
    this.fromPhone,
    this.fromEmail,
    this.fromCountry,
    this.fromState,
    this.fromAddress1,
    this.fromAddress2,
    this.fromLines,
    this.fromCity,
    this.fromZip,
    this.fromPostcode,
    this.fromLat,
    this.fromLng,
    this.fromRadius,
    this.shippingToFromDistance,
    this.paymentStateName,
    this.orderStatesName,
    this.userStatusName,
    this.deliveryStatusName,
    this.isShowStatuesPicker,
    this.image,
    this.image2,
    this.image3,
    this.images,
    this.files,
    this.objectType,
    this.ratingsCount,
    this.countRating,
    this.sumRating,
    this.averageRating,
    this.userIsRating,
    this.userObjectRating,
    this.favoritesCount,
    this.userIsFavorite,
    this.likesCount,
    this.bookmarksCount,
    this.reactionsCount,
    this.totals,
    this.items,
    this.paymentMethod,
    this.department,
    this.orderTypes,
    this.shippingMethod,
    this.user,
    this.deliveryUser,
  });

  factory OrderModule.fromJson(Map<String, dynamic> json) => OrderModule(
        id: json['id'] as num?,
        orderType: json['order_type'] as String?,
        orderTypeId: json['order_type_id'] as String?,
        vehicleTypeId: json['vehicle_type_id'] as String?,
        vehicleTypeRefType: json['vehicle_type_ref_type'] as String?,
        loadTypeId: json['load_type_id'] as String?,
        loadRefType: json['load_ref_type'] as String?,
        loadNotes: json['load_notes'] as String?,
        loadPeople: json['load_people'] as num?,
        weight: json['weight'] as num?,
        length: json['length'] as num?,
        width: json['width'] as num?,
        height: json['height'] as num?,
        isLoadStorageSensitive: json['is_load_storage_sensitive'] as num?,
        isLoadFragileMaterials: json['is_load_fragile_materials'] as num?,
        isLoadLiter: json['is_load_liter'] as num?,
        userId: json['user_id'] as num?,
        customerId: json['customer_id'] as num?,
        email: json['email'] as String?,
        orderStatesId: json['order_states_id'] as num?,
        orderStatesRefType: json['order_states_ref_type'] as String?,
        userStatus: json['user_status'] as String?,
        shippingMethodId: json['shipping_method_id'] as num?,
        shippingMethodRefType: json['shipping_method_ref_type'] as String?,
        shippingAddressId: json['shipping_address_id'] as num?,
        shippingCompany: json['shipping_company'] as String?,
        shippingFirstname: json['shipping_firstname'] as String?,
        shippingLastname: json['shipping_lastname'] as String?,
        shippingPhone: json['shipping_phone'] as String?,
        shippingEmail: json['shipping_email'] as String?,
        shippingCountry: json['shipping_country'] as String?,
        shippingState: json['shipping_state'] as String?,
        shippingAddress1: json['shipping_address_1'] as String?,
        shippingAddress2: json['shipping_address_2'] as String?,
        shippingLines: json['shipping_lines'] as String?,
        shippingCity: json['shipping_city'] as String?,
        shippingZip: json['shipping_zip'] as String?,
        shippingPostcode: json['shipping_postcode'] as String?,
        shippingLat: (json['shipping_lat'] as num?)?.toDouble(),
        shippingLng: (json['shipping_lng'] as num?)?.toDouble(),
        shippingRadius: json['shipping_radius'] as num?,
        passportType: json['passport_type'] as String?,
        passportNumber: json['passport_number'] as String?,
        bookingNumber: json['booking_number'] as String?,
        flightNumber: json['flight_number'] as String?,
        departureDestination: json['departure_destination'] as String?,
        arrivalDestination: json['arrival_destination'] as String?,
        isRoundTrip: json['is_round_trip'] as num?,
        billingDiffers: json['billing_differs'] as num?,
        billingAddressId: json['billing_address_id'] as num?,
        billingCompany: json['billing_company'] as String?,
        billingFirstname: json['billing_firstname'] as String?,
        billingLastname: json['billing_lastname'] as String?,
        billingEmail: json['billing_email'] as String?,
        billingPhone: json['billing_phone'] as String?,
        billingCountry: json['billing_country'] as String?,
        billingState: json['billing_state'] as String?,
        billingAddress1: json['billing_address_1'] as String?,
        billingAddress2: json['billing_address_2'] as String?,
        billingLines: json['billing_lines'] as String?,
        billingCity: json['billing_city'] as String?,
        billingZip: json['billing_zip'] as String?,
        billingPostcode: json['billing_postcode'] as String?,
        billingLat: (json['billing_lat'] as num?)?.toDouble(),
        billingLng: (json['billing_lng'] as num?)?.toDouble(),
        billingRadius: json['billing_radius'] as num?,
        deliveryId: json['delivery_id'] as num?,
        deliveryUserId: json['delivery_user_id'] as String?,
        deliveryVehicleTypeId: json['delivery_vehicle_type_id'] as String?,
        deliveryVehicleTypeRefType:
            json['delivery_vehicle_type_ref_type'] as String?,
        deliveryCarId: json['delivery_car_id'] as String?,
        deliveryStatus: json['delivery_status'] as String?,
        pickup: json['pickup'] as String?,
        ordersRequestsId: json['orders_requests_id'] as num?,
        assigneeId: json['assignee_id'] as num?,
        paymentMethodId: json['payment_method_id'] as num?,
        paymentState: json['payment_state'] as String?,
        processed: json['processed'] as num?,
        paymentTransId: json['payment_trans_id'] as String?,
        paymentFirstTransId: json['payment_first_trans_id'] as dynamic,
        paymentRefundTransId: json['payment_refund_trans_id'] as dynamic,
        refundTotal: json['refund_total'] as num?,
        cardType: json['card_type'] as String?,
        cardFirstName: json['card_first_name'] as String?,
        cardLastName: json['card_last_name'] as String?,
        cardNumber: json['card_number'] as String?,
        cardExpiryMonth: json['card_expiry_month'] as String?,
        cardExpiryYear: json['card_expiry_year'] as String?,
        cardCvv: json['card_cvv'] as String?,
        mainCurrencysId: json['main_currencys_id'] as String?,
        currencysId: json['currencys_id'] as String?,
        rate: json['rate'] as num?,
        distanceUnit: json['distance_unit'] as String?,
        shippingPrice: json['shipping_price'] as num?,
        shippingDistance: (json['shipping_distance'] as num?)?.toDouble(),
        shippingCost: json['shipping_cost'] as num?,
        shippingDiscount: json['shipping_discount'] as num?,
        shippingTaxes: json['shipping_taxes'] as num?,
        shippingTotal: json['shipping_total'] as num?,
        tipAmount: json['tip_amount'] as num?,
        plusAmount: json['plus_amount'] as num?,
        plusNotes: json['plus_notes'] as String?,
        minusAmount: json['minus_amount'] as num?,
        minusNotes: json['minus_notes'] as String?,
        expectedShippingTotal: json['expected_shipping_total'] as num?,
        subtotal: json['subtotal'] as num?,
        cartTotal: json['cart_total'] as num?,
        expectedCartTotal: json['expected_cart_total'] as num?,
        orderDiscount: json['order_discount'] as num?,
        orderTaxes: json['order_taxes'] as num?,
        orderTotal: json['order_total'] as num?,
        expectedOrderTotal: json['expected_order_total'] as num?,
        isBrokerage: json['is_brokerage'] as num?,
        brokerageRate: json['brokerage_rate'] as num?,
        brokerageTotal: json['brokerage_total'] as num?,
        isTransBrokerage: json['is_trans_brokerage'] as num?,
        totalPaymentPreTaxes: json['total_payment_pre_taxes'] as num?,
        totalPaymentTaxes: json['total_payment_taxes'] as num?,
        totalPaymentPostTaxes: json['total_payment_post_taxes'] as num?,
        orderDate: json['order_date'] as String?,
        returnDate: json['return_date'] as dynamic,
        deliveryAt: json['delivery_at'] as String?,
        shippedAt: json['shipped_at'] as String?,
        endDate: json['end_date'] as String?,
        becauseCancel: json['because_cancel'] as String?,
        deliveryBecauseCancel: json['delivery_because_cancel'] as String?,
        customerNotes: json['customer_notes'] as String?,
        adminNotes: json['admin_notes'] as String?,
        trackingNumber: json['tracking_number'] as String?,
        trackingUrl: json['tracking_url'] as String?,
        ipAddress: json['ip_address'] as String?,
        userAgent: json['user_agent'] as String?,
        companysId: json['companys_id'] as String?,
        departmentsId: json['departments_id'] as String?,
        countryId: json['country_id'] as num?,
        stateId: json['state_id'] as num?,
        paperId: json['paper_id'] as String?,
        extendId: json['extend_id'] as String?,
        employeesId: json['employees_id'] as String?,
        otherData: json['other_data'] as dynamic,
        configData: json['config_data'] as dynamic,
        sortOrder: json['sort_order'] as num?,
        createdBy: json['created_by'] as String?,
        updatedBy: json['updated_by'] as String?,
        deletedBy: json['deleted_by'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        deletedAt: json['deleted_at'] as String?,
        fromAddressId: json['from_address_id'] as num?,
        fromCompany: json['from_company'] as String?,
        fromFirstname: json['from_firstname'] as String?,
        fromLastname: json['from_lastname'] as String?,
        fromPhone: json['from_phone'] as String?,
        fromEmail: json['from_email'] as String?,
        fromCountry: json['from_country'] as String?,
        fromState: json['from_state'] as String?,
        fromAddress1: json['from_address_1'] as String?,
        fromAddress2: json['from_address_2'] as String?,
        fromLines: json['from_lines'] as String?,
        fromCity: json['from_city'] as String?,
        fromZip: json['from_zip'] as String?,
        fromPostcode: json['from_postcode'] as String?,
        fromLat: (json['from_lat'] as num?)?.toDouble(),
        fromLng: (json['from_lng'] as num?)?.toDouble(),
        fromRadius: json['from_radius'] as num?,
        shippingToFromDistance:
            (json['shipping_to_from_distance'] as num?)?.toDouble(),
        paymentStateName: json['payment_state_name'] as String?,
        orderStatesName: json['order_states_name'] as String?,
        userStatusName: json['user_status_name'] as String?,
        deliveryStatusName: json['delivery_status_name'] as String?,
        isShowStatuesPicker: json['is_show_statues_picker'],
        image: json['image'] as dynamic,
        image2: json['image2'] as dynamic,
        image3: json['image3'] as dynamic,
        images: json['images'] as List<dynamic>?,
        files: json['files'] as List<dynamic>?,
        objectType: json['object_type'] as String?,
        ratingsCount: json['ratings_count'] as num?,
        countRating: json['countRating'] as num?,
        sumRating: json['sumRating'] as num?,
        averageRating: json['averageRating'] as num?,
        userIsRating: json['user_is_rating'] as num?,
        userObjectRating: json['user_object_rating'] as dynamic,
        favoritesCount: json['favorites_count'] as num?,
        userIsFavorite: json['user_is_favorite'] as num?,
        likesCount: json['likes_count'] as num?,
        bookmarksCount: json['bookmarks_count'] as num?,
        reactionsCount: json['reactions_count'] as num?,
        totals: json['totals'] == null
            ? null
            : Totals.fromJson(json['totals'] as Map<String, dynamic>),
        items: json['items'] == null
            ? null
            : Items.fromJson(json['items'] as Map<String, dynamic>),
        paymentMethod: json['payment_method'] == null
            ? null
            : ServiceModul.fromJson(
                json['payment_method'] as Map<String, dynamic>),
        department: json['department'] == null
            ? null
            : ShoppingDepartment.fromJson(
                json['department'] as Map<String, dynamic>),
        orderTypes: json['order_types'] == null
            ? null
            : OrderType.fromJson(json['order_types'] as Map<String, dynamic>),
        shippingMethod: json['shipping_method'] == null
            ? null
            : ShippingMethod.fromJson(
                json['shipping_method'] as Map<String, dynamic>),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        deliveryUser: json['delivery_user'] == null
            ? null
            : DeliveryUser.fromJson(
                json['delivery_user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_type': orderType,
        'order_type_id': orderTypeId,
        'vehicle_type_id': vehicleTypeId,
        'vehicle_type_ref_type': vehicleTypeRefType,
        'load_type_id': loadTypeId,
        'load_ref_type': loadRefType,
        'load_notes': loadNotes,
        'load_people': loadPeople,
        'weight': weight,
        'length': length,
        'width': width,
        'height': height,
        'is_load_storage_sensitive': isLoadStorageSensitive,
        'is_load_fragile_materials': isLoadFragileMaterials,
        'is_load_liter': isLoadLiter,
        'user_id': userId,
        'customer_id': customerId,
        'email': email,
        'order_states_id': orderStatesId,
        'order_states_ref_type': orderStatesRefType,
        'user_status': userStatus,
        'shipping_method_id': shippingMethodId,
        'shipping_method_ref_type': shippingMethodRefType,
        'shipping_address_id': shippingAddressId,
        'shipping_company': shippingCompany,
        'shipping_firstname': shippingFirstname,
        'shipping_lastname': shippingLastname,
        'shipping_phone': shippingPhone,
        'shipping_email': shippingEmail,
        'shipping_country': shippingCountry,
        'shipping_state': shippingState,
        'shipping_address_1': shippingAddress1,
        'shipping_address_2': shippingAddress2,
        'shipping_lines': shippingLines,
        'shipping_city': shippingCity,
        'shipping_zip': shippingZip,
        'shipping_postcode': shippingPostcode,
        'shipping_lat': shippingLat,
        'shipping_lng': shippingLng,
        'shipping_radius': shippingRadius,
        'passport_type': passportType,
        'passport_number': passportNumber,
        'booking_number': bookingNumber,
        'flight_number': flightNumber,
        'departure_destination': departureDestination,
        'arrival_destination': arrivalDestination,
        'is_round_trip': isRoundTrip,
        'billing_differs': billingDiffers,
        'billing_address_id': billingAddressId,
        'billing_company': billingCompany,
        'billing_firstname': billingFirstname,
        'billing_lastname': billingLastname,
        'billing_email': billingEmail,
        'billing_phone': billingPhone,
        'billing_country': billingCountry,
        'billing_state': billingState,
        'billing_address_1': billingAddress1,
        'billing_address_2': billingAddress2,
        'billing_lines': billingLines,
        'billing_city': billingCity,
        'billing_zip': billingZip,
        'billing_postcode': billingPostcode,
        'billing_lat': billingLat,
        'billing_lng': billingLng,
        'billing_radius': billingRadius,
        'delivery_id': deliveryId,
        'delivery_user_id': deliveryUserId,
        'delivery_vehicle_type_id': deliveryVehicleTypeId,
        'delivery_vehicle_type_ref_type': deliveryVehicleTypeRefType,
        'delivery_car_id': deliveryCarId,
        'delivery_status': deliveryStatus,
        'pickup': pickup,
        'orders_requests_id': ordersRequestsId,
        'assignee_id': assigneeId,
        'payment_method_id': paymentMethodId,
        'payment_state': paymentState,
        'processed': processed,
        'payment_trans_id': paymentTransId,
        'payment_first_trans_id': paymentFirstTransId,
        'payment_refund_trans_id': paymentRefundTransId,
        'refund_total': refundTotal,
        'card_type': cardType,
        'card_first_name': cardFirstName,
        'card_last_name': cardLastName,
        'card_number': cardNumber,
        'card_expiry_month': cardExpiryMonth,
        'card_expiry_year': cardExpiryYear,
        'card_cvv': cardCvv,
        'main_currencys_id': mainCurrencysId,
        'currencys_id': currencysId,
        'rate': rate,
        'distance_unit': distanceUnit,
        'shipping_price': shippingPrice,
        'shipping_distance': shippingDistance,
        'shipping_cost': shippingCost,
        'shipping_discount': shippingDiscount,
        'shipping_taxes': shippingTaxes,
        'shipping_total': shippingTotal,
        'tip_amount': tipAmount,
        'plus_amount': plusAmount,
        'plus_notes': plusNotes,
        'minus_amount': minusAmount,
        'minus_notes': minusNotes,
        'expected_shipping_total': expectedShippingTotal,
        'subtotal': subtotal,
        'cart_total': cartTotal,
        'expected_cart_total': expectedCartTotal,
        'order_discount': orderDiscount,
        'order_taxes': orderTaxes,
        'order_total': orderTotal,
        'expected_order_total': expectedOrderTotal,
        'is_brokerage': isBrokerage,
        'brokerage_rate': brokerageRate,
        'brokerage_total': brokerageTotal,
        'is_trans_brokerage': isTransBrokerage,
        'total_payment_pre_taxes': totalPaymentPreTaxes,
        'total_payment_taxes': totalPaymentTaxes,
        'total_payment_post_taxes': totalPaymentPostTaxes,
        'order_date': orderDate,
        'return_date': returnDate,
        'delivery_at': deliveryAt,
        'shipped_at': shippedAt,
        'end_date': endDate,
        'because_cancel': becauseCancel,
        'delivery_because_cancel': deliveryBecauseCancel,
        'customer_notes': customerNotes,
        'admin_notes': adminNotes,
        'tracking_number': trackingNumber,
        'tracking_url': trackingUrl,
        'ip_address': ipAddress,
        'user_agent': userAgent,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'country_id': countryId,
        'state_id': stateId,
        'paper_id': paperId,
        'extend_id': extendId,
        'employees_id': employeesId,
        'other_data': otherData,
        'config_data': configData,
        'sort_order': sortOrder,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'deleted_by': deletedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'from_address_id': fromAddressId,
        'from_company': fromCompany,
        'from_firstname': fromFirstname,
        'from_lastname': fromLastname,
        'from_phone': fromPhone,
        'from_email': fromEmail,
        'from_country': fromCountry,
        'from_state': fromState,
        'from_address_1': fromAddress1,
        'from_address_2': fromAddress2,
        'from_lines': fromLines,
        'from_city': fromCity,
        'from_zip': fromZip,
        'from_postcode': fromPostcode,
        'from_lat': fromLat,
        'from_lng': fromLng,
        'from_radius': fromRadius,
        'shipping_to_from_distance': shippingToFromDistance,
        'payment_state_name': paymentStateName,
        'order_states_name': orderStatesName,
        'user_status_name': userStatusName,
        'delivery_status_name': deliveryStatusName,
        'is_show_statues_picker': isShowStatuesPicker,
        'image': image,
        'image2': image2,
        'image3': image3,
        'images': images,
        'files': files,
        'object_type': objectType,
        'ratings_count': ratingsCount,
        'countRating': countRating,
        'sumRating': sumRating,
        'averageRating': averageRating,
        'user_is_rating': userIsRating,
        'user_object_rating': userObjectRating,
        'favorites_count': favoritesCount,
        'user_is_favorite': userIsFavorite,
        'likes_count': likesCount,
        'bookmarks_count': bookmarksCount,
        'reactions_count': reactionsCount,
        'totals': totals?.toJson(),
        'items': items?.toJson(),
        'payment_method': paymentMethod?.toJson(),
        'department': department?.toJson(),
        'order_types': orderTypes?.toJson(),
        'shipping_method': shippingMethod?.toJson(),
        'user': user?.toJson(),
        'delivery_user': deliveryUser?.toJson(),
      };
}
