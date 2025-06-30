class ShippingMethod {
  num? id;
  String? code;
  String? name;
  String? color;
  String? description;
  num? isAutoPrice;
  String? distanceUnit;
  num? maxDistance;
  num? minDistance;
  num? price;
  num? maxPrice;
  num? minPrice;
  num? isDefault;
  num? isActive;
  String? countryId;
  String? stateId;
  String? directorateId;
  String? companysId;
  dynamic configData;
  dynamic otherData;
  String? flag;
  String? refType;
  String? refKeyName;
  String? refKeyValues;
  num? sortOrder;
  String? createdAt;
  String? updatedAt;
  dynamic logo;
  String? objectType;

  ShippingMethod({
    this.id,
    this.code,
    this.name,
    this.color,
    this.description,
    this.isAutoPrice,
    this.distanceUnit,
    this.maxDistance,
    this.minDistance,
    this.price,
    this.maxPrice,
    this.minPrice,
    this.isDefault,
    this.isActive,
    this.countryId,
    this.stateId,
    this.directorateId,
    this.companysId,
    this.configData,
    this.otherData,
    this.flag,
    this.refType,
    this.refKeyName,
    this.refKeyValues,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.objectType,
  });

  factory ShippingMethod.fromJson(Map<String, dynamic> json) {
    return ShippingMethod(
      id: json['id'] as num?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      isAutoPrice: json['is_auto_price'] as num?,
      distanceUnit: json['distance_unit'] as String?,
      maxDistance: json['max_distance'] as num?,
      minDistance: json['min_distance'] as num?,
      price: json['price'] as num?,
      maxPrice: json['max_price'] as num?,
      minPrice: json['min_price'] as num?,
      isDefault: json['is_default'] as num?,
      isActive: json['is_active'] as num?,
      countryId: json['country_id'] as String?,
      stateId: json['state_id'] as String?,
      directorateId: json['directorate_id'] as String?,
      companysId: json['companys_id'] as String?,
      configData: json['config_data'] as dynamic,
      otherData: json['other_data'] as dynamic,
      flag: json['flag'] as String?,
      refType: json['ref_type'] as String?,
      refKeyName: json['ref_key_name'] as String?,
      refKeyValues: json['ref_key_values'] as String?,
      sortOrder: json['sort_order'] as num?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      logo: json['logo'] as dynamic,
      objectType: json['object_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'color': color,
        'description': description,
        'is_auto_price': isAutoPrice,
        'distance_unit': distanceUnit,
        'max_distance': maxDistance,
        'min_distance': minDistance,
        'price': price,
        'max_price': maxPrice,
        'min_price': minPrice,
        'is_default': isDefault,
        'is_active': isActive,
        'country_id': countryId,
        'state_id': stateId,
        'directorate_id': directorateId,
        'companys_id': companysId,
        'config_data': configData,
        'other_data': otherData,
        'flag': flag,
        'ref_type': refType,
        'ref_key_name': refKeyName,
        'ref_key_values': refKeyValues,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'logo': logo,
        'object_type': objectType,
      };
}
