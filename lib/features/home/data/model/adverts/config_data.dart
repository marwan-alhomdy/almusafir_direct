import 'short_description.dart';
import 'sub_title.dart';
import 'title.dart';

class ConfigData {
  String? isLink;
  String? bgImage;
  String? bgColor;
  String? opacity;
  String? textAlign;
  Title? title;
  SubTitle? subTitle;
  ShortDescription? shortDescription;

  ConfigData({
    this.isLink,
    this.bgImage,
    this.bgColor,
    this.opacity,
    this.textAlign,
    this.title,
    this.subTitle,
    this.shortDescription,
  });

  factory ConfigData.fromJson(Map<String, dynamic> json) => ConfigData(
        isLink: json['is_link'] as String?,
        bgImage: json['bg_image'] as String?,
        bgColor: json['bg_color'] as String?,
        opacity: json['opacity'] as String?,
        textAlign: json['text_align'] as String?,
        title: json['title'] == null
            ? null
            : Title.fromJson(json['title'] as Map<String, dynamic>),
        subTitle: json['sub_title'] == null
            ? null
            : SubTitle.fromJson(json['sub_title'] as Map<String, dynamic>),
        shortDescription: json['short_description'] == null
            ? null
            : ShortDescription.fromJson(
                json['short_description'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'is_link': isLink,
        'bg_image': bgImage,
        'bg_color': bgColor,
        'opacity': opacity,
        'text_align': textAlign,
        'title': title?.toJson(),
        'sub_title': subTitle?.toJson(),
        'short_description': shortDescription?.toJson(),
      };
}
