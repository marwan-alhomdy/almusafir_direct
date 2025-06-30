import 'step_field.dart';

class ConfigData {
  String? isTagsTypeIdRequired;
  String? tagsTypeId;
  String? isMainRequired;
  String? mainLevel;
  List<StepField>? stepFields;

  ConfigData({
    this.isTagsTypeIdRequired,
    this.tagsTypeId,
    this.isMainRequired,
    this.mainLevel,
    this.stepFields,
  });

  factory ConfigData.fromJson(Map<String, dynamic> json) => ConfigData(
        isTagsTypeIdRequired: json['is_tags_type_id_required'] as String?,
        tagsTypeId: json['tags_type_id'] as String?,
        isMainRequired: json['is_main_required'] as String?,
        mainLevel: json['main_level'] as String?,
        stepFields: (json['step_fields'] as List<dynamic>?)
            ?.map((e) => StepField.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'is_tags_type_id_required': isTagsTypeIdRequired,
        'tags_type_id': tagsTypeId,
        'is_main_required': isMainRequired,
        'main_level': mainLevel,
        'step_fields': stepFields?.map((e) => e.toJson()).toList(),
      };
}
