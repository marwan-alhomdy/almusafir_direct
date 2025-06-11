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
        websiteLabel: json['website_label'],
        websiteUrl: json['website_url'],
        websiteType: json['website_type'],
        sortShow: json['sort_show'],
        isDefault: json['is_default'],
        isShow: json['is_show'],
        websiteNote: json['website_note'],
        group: json['_group'],
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
