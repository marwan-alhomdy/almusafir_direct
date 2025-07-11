class UserObjectRating {
  final int? id;
  final String? code;
  final bool? isRecommended;
  num? rating;
  String? content;

  UserObjectRating({
    this.id,
    this.code,
    this.isRecommended,
    this.rating,
    this.content,
  });

  factory UserObjectRating.fromJson(Map<String, dynamic> json) {
    return UserObjectRating(
      id: json['id'],
      code: json['code'],
      isRecommended: json['is_recommended'],
      rating: json['rating'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'is_recommended': isRecommended,
      'rating': rating,
      'content': content,
    };
  }
}
