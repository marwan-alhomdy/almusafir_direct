import 'package:almusafir_direct/core/data/models/image.dart';

import 'config_data.dart';

class DepartmentType {
  int? id;
  String? code;
  String? name;
  String? slug;
  String? refType;
  String? shortDescription;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? keywords;
  String? userId;
  String? userType;
  String? companysId;
  String? departmentsId;
  int? isDepartments;
  int? isPublic;
  int? isDefault;
  int? isActive;
  int? isPublished;
  String? publishedAt;
  String? unpublishedAt;
  dynamic properties;
  ConfigData? configData;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;
  ImageModel? image;
  List<ImageModel>? images;
  String? objectType;

  DepartmentType({
    this.id,
    this.code,
    this.name,
    this.slug,
    this.refType,
    this.shortDescription,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.keywords,
    this.userId,
    this.userType,
    this.companysId,
    this.departmentsId,
    this.isDepartments,
    this.isPublic,
    this.isDefault,
    this.isActive,
    this.isPublished,
    this.publishedAt,
    this.unpublishedAt,
    this.properties,
    this.configData,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.images,
    this.objectType,
  });

  factory DepartmentType.fromJson(Map<String, dynamic> json) {
    return DepartmentType(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      slug: json['slug'],
      refType: json['ref_type'],
      shortDescription: json['short_description'],
      description: json['description'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      keywords: json['keywords'],
      userId: json['user_id'],
      userType: json['user_type'],
      companysId: json['companys_id'],
      departmentsId: json['departments_id'],
      isDepartments: json['is_departments'],
      isPublic: json['is_public'],
      isDefault: json['is_default'],
      isActive: json['is_active'],
      isPublished: json['is_published'],
      publishedAt: json['published_at'],
      unpublishedAt: json['unpublished_at'],

      //TODO:
      // properties: json['properties'] as dynamic,
      // configData: json['config_data'] == null
      //     ? null
      //     : ConfigData.fromJson(json['config_data'] as Map<String, dynamic>),
      //objectType: json['object_type'],
      sortOrder: json['sort_order'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'slug': slug,
        'ref_type': refType,
        'short_description': shortDescription,
        'description': description,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'keywords': keywords,
        'user_id': userId,
        'user_type': userType,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'is_departments': isDepartments,
        'is_public': isPublic,
        'is_default': isDefault,
        'is_active': isActive,
        'is_published': isPublished,
        'published_at': publishedAt,
        'unpublished_at': unpublishedAt,
        'properties': properties,
        'config_data': configData?.toJson(),
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image?.toJson(),
        'images': images?.map((e) => e.toJson()).toList(),
        'object_type': objectType,
      };
}
