class Phone {
  String? phoneLabel;
  String? phoneNumber;
  String? phoneType;
  String? sortShow;
  String? isDefault;
  String? isShow;
  String? phoneNote;

  Phone({
    this.phoneLabel,
    this.phoneNumber,
    this.phoneType,
    this.sortShow,
    this.isDefault,
    this.isShow,
    this.phoneNote,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        phoneLabel: json['phone_label'] as String?,
        phoneNumber: json['phone_number'] as String?,
        phoneType: json['phone_type'] as String?,
        sortShow: json['sort_show'] as String?,
        isDefault: json['is_default'] as String?,
        isShow: json['is_show'] as String?,
        phoneNote: json['phone_note'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'phone_label': phoneLabel,
        'phone_number': phoneNumber,
        'phone_type': phoneType,
        'sort_show': sortShow,
        'is_default': isDefault,
        'is_show': isShow,
        'phone_note': phoneNote,
      };
}
