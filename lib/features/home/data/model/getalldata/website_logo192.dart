class WebsiteLogo192 {
  String? original;
  String? small;
  String? medium;
  String? large;
  String? thumb;

  WebsiteLogo192({
    this.original,
    this.small,
    this.medium,
    this.large,
    this.thumb,
  });

  factory WebsiteLogo192.fromJson(Map<String, dynamic> json) {
    return WebsiteLogo192(
      original: json['original'] as String?,
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      thumb: json['thumb'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'original': original,
        'small': small,
        'medium': medium,
        'large': large,
        'thumb': thumb,
      };
}
