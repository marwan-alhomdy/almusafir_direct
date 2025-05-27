class Email {
  String? emailLabel;
  String? emailText;
  String? sortShow;
  String? isDefault;
  String? isShow;
  String? emailNote;

  Email({
    this.emailLabel,
    this.emailText,
    this.sortShow,
    this.isDefault,
    this.isShow,
    this.emailNote,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        emailLabel: json['email_label'] as String?,
        emailText: json['email_text'] as String?,
        sortShow: json['sort_show'] as String?,
        isDefault: json['is_default'] as String?,
        isShow: json['is_show'] as String?,
        emailNote: json['email_note'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email_label': emailLabel,
        'email_text': emailText,
        'sort_show': sortShow,
        'is_default': isDefault,
        'is_show': isShow,
        'email_note': emailNote,
      };
}
