class SubTitle {
  String? isSubTitle;
  String? bgColor;
  String? opacity;
  String? textColor;
  String? textAlign;

  SubTitle({
    this.isSubTitle,
    this.bgColor,
    this.opacity,
    this.textColor,
    this.textAlign,
  });

  factory SubTitle.fromJson(Map<String, dynamic> json) => SubTitle(
        isSubTitle: json['is_sub_title'] as String?,
        bgColor: json['bg_color'] as String?,
        opacity: json['opacity'] as String?,
        textColor: json['text_color'] as String?,
        textAlign: json['text_align'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'is_sub_title': isSubTitle,
        'bg_color': bgColor,
        'opacity': opacity,
        'text_color': textColor,
        'text_align': textAlign,
      };
}
