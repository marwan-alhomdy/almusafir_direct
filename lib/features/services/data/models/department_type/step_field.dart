class StepField {
  String? name;
  String? label;
  String? icon;
  int? isActive;
  int? isRequired;
  String? defaultVal;
  String? sortOrder;

  StepField({
    this.name,
    this.label,
    this.icon,
    this.isActive,
    this.isRequired,
    this.defaultVal,
    this.sortOrder,
  });

  factory StepField.fromJson(Map<String, dynamic> json) => StepField(
        name: json['name'] as String?,
        label: json['label'] as String?,
        icon: json['icon'] as String?,
        isActive: json['is_active'] as int?,
        isRequired: json['is_required'] as int?,
        defaultVal: json['default_val'] as String?,
        sortOrder: json['sort_order'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'label': label,
        'icon': icon,
        'is_active': isActive,
        'is_required': isRequired,
        'default_val': defaultVal,
        'sort_order': sortOrder,
      };
}
