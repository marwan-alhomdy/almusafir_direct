class ImageModel {
  String? original;
  String? small;
  String? medium;
  String? large;
  String? thumb;

  ImageModel({this.original, this.small, this.medium, this.large, this.thumb});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        original: json['original'],
        small: json['small'],
        medium: json['medium'],
        large: json['large'],
        thumb: json['thumb'],
      );

  Map<String, dynamic> toJson() => {
        'original': original,
        'small': small,
        'medium': medium,
        'large': large,
        'thumb': thumb,
      };
}
