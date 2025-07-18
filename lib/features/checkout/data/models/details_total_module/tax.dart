class Tax {
  String? name;
  String? label;
  String? priority;
  bool? removeable;
  String? cartInstance;
  List<dynamic>? metaData;

  Tax({
    this.name,
    this.label,
    this.priority,
    this.removeable,
    this.cartInstance,
    this.metaData,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        name: json['name'] as String?,
        label: json['label'] as String?,
        priority: json['priority'] as String?,
        removeable: json['removeable'] as bool?,
        cartInstance: json['cartInstance'] as String?,
        metaData: json['metaData'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'label': label,
        'priority': priority,
        'removeable': removeable,
        'cartInstance': cartInstance,
        'metaData': metaData,
      };
}
