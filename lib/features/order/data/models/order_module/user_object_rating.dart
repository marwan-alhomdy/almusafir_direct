class UserObjectRating {
  int? id;
  String? code;
  bool? isRecommended;
  int? rating;
  String? title;
  dynamic content;
  bool? approved;
  String? reviewrateableType;
  int? reviewrateableId;
  String? userType;
  int? userId;
  dynamic name;
  dynamic email;
  String? url;
  String? hash;
  String? locale;
  String? ip;
  dynamic ipForwarded;
  String? userAgent;
  String? companysId;
  String? departmentsId;
  bool? isActive;
  int? isPositive;
  double? probability;
  dynamic otherData;
  dynamic configData;
  int? sortOrder;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  UserObjectRating({
    this.id,
    this.code,
    this.isRecommended,
    this.rating,
    this.title,
    this.content,
    this.approved,
    this.reviewrateableType,
    this.reviewrateableId,
    this.userType,
    this.userId,
    this.name,
    this.email,
    this.url,
    this.hash,
    this.locale,
    this.ip,
    this.ipForwarded,
    this.userAgent,
    this.companysId,
    this.departmentsId,
    this.isActive,
    this.isPositive,
    this.probability,
    this.otherData,
    this.configData,
    this.sortOrder,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserObjectRating.fromJson(Map<String, dynamic> json) {
    return UserObjectRating(
      id: json['id'] as int?,
      code: json['code'] as String?,
      isRecommended: json['is_recommended'] as bool?,
      rating: json['rating'] as int?,
      title: json['title'] as String?,
      content: json['content'] as dynamic,
      approved: json['approved'] as bool?,
      reviewrateableType: json['reviewrateable_type'] as String?,
      reviewrateableId: json['reviewrateable_id'] as int?,
      userType: json['user_type'] as String?,
      userId: json['user_id'] as int?,
      name: json['name'] as dynamic,
      email: json['email'] as dynamic,
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      locale: json['locale'] as String?,
      ip: json['ip'] as String?,
      ipForwarded: json['ip_forwarded'] as dynamic,
      userAgent: json['user_agent'] as String?,
      companysId: json['companys_id'] as String?,
      departmentsId: json['departments_id'] as String?,
      isActive: json['is_active'] as bool?,
      isPositive: json['is_positive'] as int?,
      probability: (json['probability'] as num?)?.toDouble(),
      otherData: json['other_data'] as dynamic,
      configData: json['config_data'] as dynamic,
      sortOrder: json['sort_order'] as int?,
      createdBy: json['created_by'] as dynamic,
      updatedBy: json['updated_by'] as dynamic,
      deletedBy: json['deleted_by'] as dynamic,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'is_recommended': isRecommended,
        'rating': rating,
        'title': title,
        'content': content,
        'approved': approved,
        'reviewrateable_type': reviewrateableType,
        'reviewrateable_id': reviewrateableId,
        'user_type': userType,
        'user_id': userId,
        'name': name,
        'email': email,
        'url': url,
        'hash': hash,
        'locale': locale,
        'ip': ip,
        'ip_forwarded': ipForwarded,
        'user_agent': userAgent,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'is_active': isActive,
        'is_positive': isPositive,
        'probability': probability,
        'other_data': otherData,
        'config_data': configData,
        'sort_order': sortOrder,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'deleted_by': deletedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
      };
}
