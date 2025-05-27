class Title {
  String? isTitle;
  String? bgColor;
  String? opacity;
  String? textColor;
  String? textAlign;

  Title({
    this.isTitle,
    this.bgColor,
    this.opacity,
    this.textColor,
    this.textAlign,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        isTitle: json['is_title'] as String?,
        bgColor: json['bg_color'] as String?,
        opacity: json['opacity'] as String?,
        textColor: json['text_color'] as String?,
        textAlign: json['text_align'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'is_title': isTitle,
        'bg_color': bgColor,
        'opacity': opacity,
        'text_color': textColor,
        'text_align': textAlign,
      };
}
