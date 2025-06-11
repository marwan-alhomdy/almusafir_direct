import '../../../../../core/data/models/image.dart';

class OrderType {
  int? id;
  String? code;
  String? refType;
  String? name;
  String? color;
  String? description;
  String? companysId;
  String? departmentsId;
  int? isRequiredCart;
  int? isCheckMinCartTotal;
  int? isCheckMaxCartTotal;
  int? isMultiShopInCart;
  int? isFreeShopShipping;
  int? isFirstOrderFree;
  int? isFirstOrderShopFree;
  int? isAllowExpectedCartTotal;
  int? isRequiredExpectedCartTotal;
  int? isAllowNewItemCart;
  int? isExtentOfDelivery;
  int? isDefaultShopId;
  int? isCheckAppOpen;
  int? isRequiredShopId;
  int? isCheckShopOpen;
  int? isAllowVehicleType;
  int? isRequiredVehicleType;
  String? defaultVehicleType;
  int? isAllowLoadType;
  int? isRequiredLoadType;
  String? defaultLoadType;
  int? isAllowLoadPeople;
  int? isRequiredLoadPeople;
  int? defaultLoadPeople;
  int? isAllowCustomerNotes;
  int? isRequiredCustomerNotes;
  int? isAllowCancel;
  String? allowTimeCancel;
  int? isAllowBecauseCancel;
  int? isRequiredBecauseCancel;
  int? isAllowLoadNotes;
  int? isRequiredLoadNotes;
  int? isLoadLiter;
  int? isAllowWeight;
  int? isRequiredWeight;
  int? isAllowLength;
  int? isRequiredLength;
  int? isAllowWidth;
  int? isRequiredWidth;
  int? isAllowHeight;
  int? isRequiredHeight;
  int? isAllowLoadStorageSensitive;
  int? isRequiredLoadStorageSensitive;
  int? defaultLoadStorageSensitive;
  int? isAllowLoadFragileMaterials;
  int? isRequiredLoadFragileMaterials;
  int? defaultLoadFragileMaterials;
  int? isBrokerage;
  String? brokerageRate;
  int? isAllowShiping;
  int? isRequiredShiping;
  int? isCalcExpectedShiping;
  int? isAllowCoupon;
  int? isAllowCouponShiping;
  int? isAllowTip;
  int? isAllowDouble;
  int? doubleCheckMatchItemsOrder;
  int? doubleCheckMatchSubtotalItemsOrder;
  int? doubleCheckMatchCouponOrder;
  int? doubleCheckMatchCouponShiping;
  int? doubleCheckMatchTipOrder;
  int? doubleCheckMatchShipingOrder;
  int? isAllowOfflinePaymenet;
  int? isAllowImage;
  int? isAllowFromAddress;
  int? isRequiredFromAddress;
  int? isAllowShippingAddress;
  int? isRequiredShippingAddress;
  int? isAllowBillingAddress;
  int? isRequiredBillingAddress;
  int? isRequiredImage;
  int? isAllowListRequests;
  int? isPublicDeliverys;
  int? isPrivateDeliverys;
  int? isAppDeliverys;
  int? isUseCustomers;
  int? isUseManageShop;
  int? isDefault;
  int? isHidden;
  int? isActive;
  int? isSoon;
  String? status;
  dynamic otherData;
  dynamic configData;
  String? flag;
  int? sortOrder;
  String? createdBy;
  String? updatedBy;
  String? deletedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  ImageModel? image;
  List<dynamic>? images;
  List<dynamic>? files;
  String? objectType;

  int? isBooking;
  String? orderDate;
  String? returnDate;
  int? isRoundTrip;

  OrderType({
    this.id,
    this.code,
    this.refType,
    this.name,
    this.color,
    this.description,
    this.companysId,
    this.departmentsId,
    this.isRequiredCart,
    this.isCheckMinCartTotal,
    this.isCheckMaxCartTotal,
    this.isMultiShopInCart,
    this.isFreeShopShipping,
    this.isFirstOrderFree,
    this.isFirstOrderShopFree,
    this.isAllowExpectedCartTotal,
    this.isRequiredExpectedCartTotal,
    this.isAllowNewItemCart,
    this.isExtentOfDelivery,
    this.isDefaultShopId,
    this.isCheckAppOpen,
    this.isRequiredShopId,
    this.isCheckShopOpen,
    this.isAllowVehicleType,
    this.isRequiredVehicleType,
    this.defaultVehicleType,
    this.isAllowLoadType,
    this.isRequiredLoadType,
    this.defaultLoadType,
    this.isAllowLoadPeople,
    this.isRequiredLoadPeople,
    this.defaultLoadPeople,
    this.isAllowCustomerNotes,
    this.isRequiredCustomerNotes,
    this.isAllowCancel,
    this.allowTimeCancel,
    this.isAllowBecauseCancel,
    this.isRequiredBecauseCancel,
    this.isAllowLoadNotes,
    this.isRequiredLoadNotes,
    this.isLoadLiter,
    this.isAllowWeight,
    this.isRequiredWeight,
    this.isAllowLength,
    this.isRequiredLength,
    this.isAllowWidth,
    this.isRequiredWidth,
    this.isAllowHeight,
    this.isRequiredHeight,
    this.isAllowLoadStorageSensitive,
    this.isRequiredLoadStorageSensitive,
    this.defaultLoadStorageSensitive,
    this.isAllowLoadFragileMaterials,
    this.isRequiredLoadFragileMaterials,
    this.defaultLoadFragileMaterials,
    this.isBrokerage,
    this.brokerageRate,
    this.isAllowShiping,
    this.isRequiredShiping,
    this.isCalcExpectedShiping,
    this.isAllowCoupon,
    this.isAllowCouponShiping,
    this.isAllowTip,
    this.isAllowDouble,
    this.doubleCheckMatchItemsOrder,
    this.doubleCheckMatchSubtotalItemsOrder,
    this.doubleCheckMatchCouponOrder,
    this.doubleCheckMatchCouponShiping,
    this.doubleCheckMatchTipOrder,
    this.doubleCheckMatchShipingOrder,
    this.isAllowOfflinePaymenet,
    this.isAllowImage,
    this.isAllowFromAddress,
    this.isRequiredFromAddress,
    this.isAllowShippingAddress,
    this.isRequiredShippingAddress,
    this.isAllowBillingAddress,
    this.isRequiredBillingAddress,
    this.isRequiredImage,
    this.isAllowListRequests,
    this.isPublicDeliverys,
    this.isPrivateDeliverys,
    this.isAppDeliverys,
    this.isUseCustomers,
    this.isUseManageShop,
    this.isDefault,
    this.isHidden,
    this.isActive,
    this.isSoon,
    this.status,
    this.otherData,
    this.configData,
    this.flag,
    this.sortOrder,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.image,
    this.images,
    this.files,
    this.objectType,
    this.orderDate,
    this.returnDate,
    this.isRoundTrip,
    this.isBooking,
  });

  factory OrderType.fromJson(Map<String, dynamic> json) => OrderType(
        id: json['id'],
        code: json['code'],
        refType: json['ref_type'],
        name: json['name'],
        color: json['color'],
        description: json['description'],
        companysId: json['companys_id'],
        departmentsId: json['departments_id'],
        isRequiredCart: json['is_required_cart'],
        isCheckMinCartTotal: json['is_check_min_cart_total'],
        isCheckMaxCartTotal: json['is_check_max_cart_total'],
        isMultiShopInCart: json['is_multi_shop_in_cart'],
        isFreeShopShipping: json['is_free_shop_shipping'],
        isFirstOrderFree: json['is_first_order_free'],
        isFirstOrderShopFree: json['is_first_order_shop_free'],
        isAllowExpectedCartTotal: json['is_allow_expected_cart_total'],
        isRequiredExpectedCartTotal: json['is_required_expected_cart_total'],
        isAllowNewItemCart: json['is_allow_new_item_cart'],
        isExtentOfDelivery: json['is_extent_of_delivery'],
        isDefaultShopId: json['is_default_shop_id'],
        isCheckAppOpen: json['is_check_app_open'],
        isRequiredShopId: json['is_required_shop_id'],
        isCheckShopOpen: json['is_check_shop_open'],
        isAllowVehicleType: json['is_allow_vehicle_type'],
        isRequiredVehicleType: json['is_required_vehicle_type'],
        defaultVehicleType: json['default_vehicle_type'],
        isAllowLoadType: json['is_allow_load_type'],
        isRequiredLoadType: json['is_required_load_type'],
        defaultLoadType: json['default_load_type'],
        isAllowLoadPeople: json['is_allow_load_people'],
        isRequiredLoadPeople: json['is_required_load_people'],
        defaultLoadPeople: json['default_load_people'],
        isAllowCustomerNotes: json['is_allow_customer_notes'],
        isRequiredCustomerNotes: json['is_required_customer_notes'],
        isAllowCancel: json['is_allow_cancel'],
        allowTimeCancel: json['allow_time_cancel'],
        isAllowBecauseCancel: json['is_allow_because_cancel'],
        isRequiredBecauseCancel: json['is_required_because_cancel'],
        isAllowLoadNotes: json['is_allow_load_notes'],
        isRequiredLoadNotes: json['is_required_load_notes'],
        isLoadLiter: json['is_load_liter'],
        isAllowWeight: json['is_allow_weight'],
        isRequiredWeight: json['is_required_weight'],
        isAllowLength: json['is_allow_length'],
        isRequiredLength: json['is_required_length'],
        isAllowWidth: json['is_allow_width'],
        isRequiredWidth: json['is_required_width'],
        isAllowHeight: json['is_allow_height'],
        isRequiredHeight: json['is_required_height'],
        isAllowLoadStorageSensitive: json['is_allow_load_storage_sensitive'],
        isRequiredLoadStorageSensitive:
            json['is_required_load_storage_sensitive'],
        defaultLoadStorageSensitive: json['default_load_storage_sensitive'],
        isAllowLoadFragileMaterials: json['is_allow_load_fragile_materials'],
        isRequiredLoadFragileMaterials:
            json['is_required_load_fragile_materials'],
        defaultLoadFragileMaterials: json['default_load_fragile_materials'],
        isBrokerage: json['is_brokerage'],
        brokerageRate: json['brokerage_rate'],
        isAllowShiping: json['is_allow_shiping'],
        isRequiredShiping: json['is_required_shiping'],
        isCalcExpectedShiping: json['is_calc_expected_shiping'],
        isAllowCoupon: json['is_allow_coupon'],
        isAllowCouponShiping: json['is_allow_coupon_shiping'],
        isAllowTip: json['is_allow_tip'],
        isAllowDouble: json['is_allow_double'],
        doubleCheckMatchItemsOrder: json['double_check_match_items_order'],
        doubleCheckMatchSubtotalItemsOrder:
            json['double_check_match_subtotal_items_order'],
        doubleCheckMatchCouponOrder: json['double_check_match_coupon_order'],
        doubleCheckMatchCouponShiping:
            json['double_check_match_coupon_shiping'],
        doubleCheckMatchTipOrder: json['double_check_match_tip_order'],
        doubleCheckMatchShipingOrder: json['double_check_match_shiping_order'],
        isAllowOfflinePaymenet: json['is_allow_offline_paymenet'],
        isAllowImage: json['is_allow_image'],
        isAllowFromAddress: json['is_allow_from_address'],
        isRequiredFromAddress: json['is_required_from_address'],
        isAllowShippingAddress: json['is_allow_shipping_address'],
        isRequiredShippingAddress: json['is_required_shipping_address'],
        isAllowBillingAddress: json['is_allow_billing_address'],
        isRequiredBillingAddress: json['is_required_billing_address'],
        isRequiredImage: json['is_required_image'],
        isAllowListRequests: json['is_allow_list_requests'],
        isPublicDeliverys: json['is_public_deliverys'],
        isPrivateDeliverys: json['is_private_deliverys'],
        isAppDeliverys: json['is_app_deliverys'],
        isUseCustomers: json['is_use_customers'],
        isUseManageShop: json['is_use_manage_shop'],
        isDefault: json['is_default'],
        isHidden: json['is_hidden'],
        isActive: json['is_active'],
        isSoon: json['is_soon'],
        status: json['status'],
        otherData: json['other_data'] as dynamic,
        configData: json['config_data'] as dynamic,
        flag: json['flag'],
        sortOrder: json['sort_order'],
        createdBy: json['created_by'],
        updatedBy: json['updated_by'],
        deletedBy: json['deleted_by'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'],
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        images: json['images'] as List<dynamic>?,
        files: json['files'] as List<dynamic>?,
        objectType: json['object_type'],
        isBooking: json['is_booking'],
        orderDate: json['date_order'],
        returnDate: json['return_date'],
        isRoundTrip: json['is_round_trip'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'ref_type': refType,
        'name': name,
        'color': color,
        'description': description,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'is_required_cart': isRequiredCart,
        'is_check_min_cart_total': isCheckMinCartTotal,
        'is_check_max_cart_total': isCheckMaxCartTotal,
        'is_multi_shop_in_cart': isMultiShopInCart,
        'is_free_shop_shipping': isFreeShopShipping,
        'is_first_order_free': isFirstOrderFree,
        'is_first_order_shop_free': isFirstOrderShopFree,
        'is_allow_expected_cart_total': isAllowExpectedCartTotal,
        'is_required_expected_cart_total': isRequiredExpectedCartTotal,
        'is_allow_new_item_cart': isAllowNewItemCart,
        'is_extent_of_delivery': isExtentOfDelivery,
        'is_default_shop_id': isDefaultShopId,
        'is_check_app_open': isCheckAppOpen,
        'is_required_shop_id': isRequiredShopId,
        'is_check_shop_open': isCheckShopOpen,
        'is_allow_vehicle_type': isAllowVehicleType,
        'is_required_vehicle_type': isRequiredVehicleType,
        'default_vehicle_type': defaultVehicleType,
        'is_allow_load_type': isAllowLoadType,
        'is_required_load_type': isRequiredLoadType,
        'default_load_type': defaultLoadType,
        'is_allow_load_people': isAllowLoadPeople,
        'is_required_load_people': isRequiredLoadPeople,
        'default_load_people': defaultLoadPeople,
        'is_allow_customer_notes': isAllowCustomerNotes,
        'is_required_customer_notes': isRequiredCustomerNotes,
        'is_allow_cancel': isAllowCancel,
        'allow_time_cancel': allowTimeCancel,
        'is_allow_because_cancel': isAllowBecauseCancel,
        'is_required_because_cancel': isRequiredBecauseCancel,
        'is_allow_load_notes': isAllowLoadNotes,
        'is_required_load_notes': isRequiredLoadNotes,
        'is_load_liter': isLoadLiter,
        'is_allow_weight': isAllowWeight,
        'is_required_weight': isRequiredWeight,
        'is_allow_length': isAllowLength,
        'is_required_length': isRequiredLength,
        'is_allow_width': isAllowWidth,
        'is_required_width': isRequiredWidth,
        'is_allow_height': isAllowHeight,
        'is_required_height': isRequiredHeight,
        'is_allow_load_storage_sensitive': isAllowLoadStorageSensitive,
        'is_required_load_storage_sensitive': isRequiredLoadStorageSensitive,
        'default_load_storage_sensitive': defaultLoadStorageSensitive,
        'is_allow_load_fragile_materials': isAllowLoadFragileMaterials,
        'is_required_load_fragile_materials': isRequiredLoadFragileMaterials,
        'default_load_fragile_materials': defaultLoadFragileMaterials,
        'is_brokerage': isBrokerage,
        'brokerage_rate': brokerageRate,
        'is_allow_shiping': isAllowShiping,
        'is_required_shiping': isRequiredShiping,
        'is_calc_expected_shiping': isCalcExpectedShiping,
        'is_allow_coupon': isAllowCoupon,
        'is_allow_coupon_shiping': isAllowCouponShiping,
        'is_allow_tip': isAllowTip,
        'is_allow_double': isAllowDouble,
        'double_check_match_items_order': doubleCheckMatchItemsOrder,
        'double_check_match_subtotal_items_order':
            doubleCheckMatchSubtotalItemsOrder,
        'double_check_match_coupon_order': doubleCheckMatchCouponOrder,
        'double_check_match_coupon_shiping': doubleCheckMatchCouponShiping,
        'double_check_match_tip_order': doubleCheckMatchTipOrder,
        'double_check_match_shiping_order': doubleCheckMatchShipingOrder,
        'is_allow_offline_paymenet': isAllowOfflinePaymenet,
        'is_allow_image': isAllowImage,
        'is_allow_from_address': isAllowFromAddress,
        'is_required_from_address': isRequiredFromAddress,
        'is_allow_shipping_address': isAllowShippingAddress,
        'is_required_shipping_address': isRequiredShippingAddress,
        'is_allow_billing_address': isAllowBillingAddress,
        'is_required_billing_address': isRequiredBillingAddress,
        'is_required_image': isRequiredImage,
        'is_allow_list_requests': isAllowListRequests,
        'is_public_deliverys': isPublicDeliverys,
        'is_private_deliverys': isPrivateDeliverys,
        'is_app_deliverys': isAppDeliverys,
        'is_use_customers': isUseCustomers,
        'is_use_manage_shop': isUseManageShop,
        'is_default': isDefault,
        'is_hidden': isHidden,
        'is_active': isActive,
        'is_soon': isSoon,
        'status': status,
        'other_data': otherData,
        'config_data': configData,
        'flag': flag,
        'sort_order': sortOrder,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'deleted_by': deletedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'image': image?.toJson(),
        'images': images,
        'files': files,
        'object_type': objectType,
        'date_order': orderDate,
        "order_date": orderDate,
        "return_date": returnDate,
        "is_booking": isBooking,
        "is_round_trip": isRoundTrip,
      };
}
