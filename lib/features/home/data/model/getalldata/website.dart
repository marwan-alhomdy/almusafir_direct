class Website {
  String? websiteLabel;
  String? websiteUrl;
  String? websiteType;
  String? sortShow;
  String? isDefault;
  String? isShow;
  String? websiteNote;
  String? group;

  Website({
    this.websiteLabel,
    this.websiteUrl,
    this.websiteType,
    this.sortShow,
    this.isDefault,
    this.isShow,
    this.websiteNote,
    this.group,
  });

  factory Website.fromJson(Map<String, dynamic> json) => Website(
        websiteLabel: json['website_label'] as String?,
        websiteUrl: json['website_url'] as String?,
        websiteType: json['website_type'] as String?,
        sortShow: json['sort_show'] as String?,
        isDefault: json['is_default'] as String?,
        isShow: json['is_show'] as String?,
        websiteNote: json['website_note'] as String?,
        group: json['_group'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'website_label': websiteLabel,
        'website_url': websiteUrl,
        'website_type': websiteType,
        'sort_show': sortShow,
        'is_default': isDefault,
        'is_show': isShow,
        'website_note': websiteNote,
        '_group': group,
      };
}
