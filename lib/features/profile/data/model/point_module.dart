class PointModule {
  num? id;
  String? name;
  String? description;
  dynamic icon;
  num? levelId;
  num? userId;
  String? userType;
  dynamic eventType;
  dynamic subjectId;
  dynamic subjectType;
  String? currencysId;
  String? mainCurrencysId;
  dynamic currencyConversionsId;
  dynamic currencyConversionsData;
  String? rate;
  num? price;
  num? priceAlien;
  num? points;
  num? total;
  num? totalAlien;
  String? type;
  String? processType;
  String? dateAt;
  dynamic readAt;
  String? url;
  String? ipAddress;
  dynamic ipForwarded;
  String? userAgent;
  String? extendId;
  String? companysId;
  String? departmentsId;
  num? isRelay;
  dynamic userRelayId;
  dynamic relayDateAt;
  bool? isActive;
  String? status;
  dynamic otherData;
  dynamic configData;
  num? sortOrder;
  String? createdAt;
  String? updatedAt;
  String? objectType;

  PointModule({
    this.id,
    this.name,
    this.description,
    this.icon,
    this.levelId,
    this.userId,
    this.userType,
    this.eventType,
    this.subjectId,
    this.subjectType,
    this.currencysId,
    this.mainCurrencysId,
    this.currencyConversionsId,
    this.currencyConversionsData,
    this.rate,
    this.price,
    this.priceAlien,
    this.points,
    this.total,
    this.totalAlien,
    this.type,
    this.processType,
    this.dateAt,
    this.readAt,
    this.url,
    this.ipAddress,
    this.ipForwarded,
    this.userAgent,
    this.extendId,
    this.companysId,
    this.departmentsId,
    this.isRelay,
    this.userRelayId,
    this.relayDateAt,
    this.isActive,
    this.status,
    this.otherData,
    this.configData,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.objectType,
  });

  factory PointModule.fromJson(Map<String, dynamic> json) => PointModule(
        id: json['id'] as num?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as dynamic,
        levelId: json['level_id'] as num?,
        userId: json['user_id'] as num?,
        userType: json['user_type'] as String?,
        eventType: json['event_type'] as dynamic,
        subjectId: json['subject_id'] as dynamic,
        subjectType: json['subject_type'] as dynamic,
        currencysId: json['currencys_id'] as String?,
        mainCurrencysId: json['main_currencys_id'] as String?,
        currencyConversionsId: json['currency_conversions_id'] as dynamic,
        currencyConversionsData: json['currency_conversions_data'] as dynamic,
        rate: json['rate'] as String?,
        price: json['price'] as num?,
        priceAlien: json['price_alien'] as num?,
        points: json['points'] as num?,
        total: json['total'] as num?,
        totalAlien: json['total_alien'] as num?,
        type: json['type'] as String?,
        processType: json['process_type'] as String?,
        dateAt: json['date_at'] as String?,
        readAt: json['read_at'] as dynamic,
        url: json['url'] as String?,
        ipAddress: json['ip_address'] as String?,
        ipForwarded: json['ip_forwarded'] as dynamic,
        userAgent: json['user_agent'] as String?,
        extendId: json['extend_id'] as String?,
        companysId: json['companys_id'] as String?,
        departmentsId: json['departments_id'] as String?,
        isRelay: json['is_relay'] as num?,
        userRelayId: json['user_relay_id'] as dynamic,
        relayDateAt: json['relay_date_at'] as dynamic,
        isActive: json['is_active'] as bool?,
        status: json['status'] as String?,
        otherData: json['other_data'] as dynamic,
        configData: json['config_data'] as dynamic,
        sortOrder: json['sort_order'] as num?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        objectType: json['object_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'icon': icon,
        'level_id': levelId,
        'user_id': userId,
        'user_type': userType,
        'event_type': eventType,
        'subject_id': subjectId,
        'subject_type': subjectType,
        'currencys_id': currencysId,
        'main_currencys_id': mainCurrencysId,
        'currency_conversions_id': currencyConversionsId,
        'currency_conversions_data': currencyConversionsData,
        'rate': rate,
        'price': price,
        'price_alien': priceAlien,
        'points': points,
        'total': total,
        'total_alien': totalAlien,
        'type': type,
        'process_type': processType,
        'date_at': dateAt,
        'read_at': readAt,
        'url': url,
        'ip_address': ipAddress,
        'ip_forwarded': ipForwarded,
        'user_agent': userAgent,
        'extend_id': extendId,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'is_relay': isRelay,
        'user_relay_id': userRelayId,
        'relay_date_at': relayDateAt,
        'is_active': isActive,
        'status': status,
        'other_data': otherData,
        'config_data': configData,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'object_type': objectType,
      };
}
