class PhoneModel {
  String? phoneLabel;
  String? phoneNumber;
  String? phoneType;
  String? sortShow;
  String? isDefault;
  String? isShow;
  String? phoneNote;
  String? group;

  PhoneModel({
    this.phoneLabel,
    this.phoneNumber,
    this.phoneType,
    this.sortShow,
    this.isDefault,
    this.isShow,
    this.phoneNote,
    this.group,
  });

  factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
        phoneLabel: json['phone_label'],
        phoneNumber: json['phone_number'],
        phoneType: json['phone_type'],
        sortShow: json['sort_show'],
        isDefault: json['is_default'],
        isShow: json['is_show'],
        phoneNote: json['phone_note'],
        group: json['_group'],
      );

  Map<String, dynamic> toJson() => {
        'phone_label': phoneLabel,
        'phone_number': phoneNumber,
        'phone_type': phoneType,
        'sort_show': sortShow,
        'is_default': isDefault,
        'is_show': isShow,
        'phone_note': phoneNote,
        '_group': group,
      };
}
