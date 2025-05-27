class SocialLink {
  String? icon;
  String? name;
  String? link;

  SocialLink({this.icon, this.name, this.link});

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        icon: json['icon'] as String?,
        name: json['name'] as String?,
        link: json['link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'name': name,
        'link': link,
      };
}
