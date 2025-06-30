class Datum {
  int? id;
  String? code;
  int? ordersId;
  String? title;
  int? priority;
  int? value;
  int? isSummable;
  dynamic metaData;
  String? notes;
  String? companysId;
  String? departmentsId;
  dynamic otherData;
  dynamic configData;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.code,
    this.ordersId,
    this.title,
    this.priority,
    this.value,
    this.isSummable,
    this.metaData,
    this.notes,
    this.companysId,
    this.departmentsId,
    this.otherData,
    this.configData,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        code: json['code'] as String?,
        ordersId: json['orders_id'] as int?,
        title: json['title'] as String?,
        priority: json['priority'] as int?,
        value: json['value'] as int?,
        isSummable: json['is_summable'] as int?,
        metaData: json['metaData'] as dynamic,
        notes: json['notes'] as String?,
        companysId: json['companys_id'] as String?,
        departmentsId: json['departments_id'] as String?,
        otherData: json['other_data'] as dynamic,
        configData: json['config_data'] as dynamic,
        sortOrder: json['sort_order'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'orders_id': ordersId,
        'title': title,
        'priority': priority,
        'value': value,
        'is_summable': isSummable,
        'metaData': metaData,
        'notes': notes,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'other_data': otherData,
        'config_data': configData,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
