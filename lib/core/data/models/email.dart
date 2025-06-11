class EmailModel {
  String? emailLabel;
  String? emailText;
  String? sortShow;
  String? isDefault;
  String? isShow;
  String? emailNote;
  String? group;

  EmailModel({
    this.emailLabel,
    this.emailText,
    this.sortShow,
    this.isDefault,
    this.isShow,
    this.emailNote,
    this.group,
  });

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
        emailLabel: json['email_label'],
        emailText: json['email_text'],
        sortShow: json['sort_show'],
        isDefault: json['is_default'],
        isShow: json['is_show'],
        emailNote: json['email_note'],
        group: json['_group'],
      );

  Map<String, dynamic> toJson() => {
        'email_label': emailLabel,
        'email_text': emailText,
        'sort_show': sortShow,
        'is_default': isDefault,
        'is_show': isShow,
        'email_note': emailNote,
        '_group': group,
      };
}
