class Referral {
  int? id;
  String? userType;
  int? userId;
  String? alias;
  String? link;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? textDisplay;
  String? imageDisplay;
  String? objectType;

  Referral({
    this.id,
    this.userType,
    this.userId,
    this.alias,
    this.link,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.textDisplay,
    this.imageDisplay,
    this.objectType,
  });

  factory Referral.fromJson(Map<String, dynamic> json) => Referral(
        id: json['id'] as int?,
        userType: json['user_type'] as String?,
        userId: json['user_id'] as int?,
        alias: json['alias'] as String?,
        link: json['link'] as String?,
        isActive: json['is_active'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        textDisplay: json['text_display'] as String?,
        imageDisplay: json['image_display'] as String?,
        objectType: json['object_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_type': userType,
        'user_id': userId,
        'alias': alias,
        'link': link,
        'is_active': isActive,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'text_display': textDisplay,
        'image_display': imageDisplay,
        'object_type': objectType,
      };
}
