class Avatar {
  String? original;
  String? small;
  String? medium;
  String? large;
  String? thumb;

  Avatar({this.original, this.small, this.medium, this.large, this.thumb});

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        original: json['original'] as String?,
        small: json['small'] as String?,
        medium: json['medium'] as String?,
        large: json['large'] as String?,
        thumb: json['thumb'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'original': original,
        'small': small,
        'medium': medium,
        'large': large,
        'thumb': thumb,
      };
}
