class ShortDescription {
  String? isShortDescription;
  String? bgColor;
  String? opacity;
  String? textColor;
  String? textAlign;

  ShortDescription({
    this.isShortDescription,
    this.bgColor,
    this.opacity,
    this.textColor,
    this.textAlign,
  });

  factory ShortDescription.fromJson(Map<String, dynamic> json) {
    return ShortDescription(
      isShortDescription: json['is_short_description'] as String?,
      bgColor: json['bg_color'] as String?,
      opacity: json['opacity'] as String?,
      textColor: json['text_color'] as String?,
      textAlign: json['text_align'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'is_short_description': isShortDescription,
        'bg_color': bgColor,
        'opacity': opacity,
        'text_color': textColor,
        'text_align': textAlign,
      };
}
