import 'models/image.dart';

class ServiceModul {
  int? id;
  String? name;
  String? color;
  String? refType;
  String? shortDescription;
  String? description;
  String? transportsType;
  String? countryId;
  String? stateId;
  String? directorateId;
  int? isDefault;
  int? isPublic;
  int? isActive;
  String? status;
  int? isPublished;
  String? publishedAt;
  String? unpublishedAt;
  String? airlineId;
  String? companysId;
  String? departmentsId;
  dynamic configData;
  dynamic otherData;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;
  ImageModel? image;
  ImageModel? logo;
  List<dynamic>? images;
  List<dynamic>? files;

  ServiceModul({
    this.id,
    this.name,
    this.color,
    this.refType,
    this.shortDescription,
    this.description,
    this.transportsType,
    this.countryId,
    this.stateId,
    this.directorateId,
    this.isDefault,
    this.isPublic,
    this.isActive,
    this.status,
    this.isPublished,
    this.publishedAt,
    this.unpublishedAt,
    this.airlineId,
    this.companysId,
    this.departmentsId,
    this.configData,
    this.otherData,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.image,
    this.images,
    this.files,
  });

  factory ServiceModul.fromJson(Map<String, dynamic> json) => ServiceModul(
        id: json['id'],
        name: json['name'],
        color: json['color'],
        refType: json['ref_type'],
        shortDescription: json['short_description'],
        description: json['description'],
        transportsType: json['transports_type'],
        countryId: json['country_id'],
        stateId: json['state_id'],
        directorateId: json['directorate_id'],
        isDefault: json['is_default'],
        isPublic: json['is_public'],
        isActive: json['is_active'],
        status: json['status'],
        isPublished: json['is_published'],
        publishedAt: json['published_at'],
        unpublishedAt: json['unpublished_at'],
        airlineId: json['airline_id'],
        companysId: json['companys_id'],
        departmentsId: json['departments_id'],
        configData: json['config_data'],
        otherData: json['other_data'],
        sortOrder: json['sort_order'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        logo: json['logo'] == null
            ? null
            : ImageModel.fromJson(json['logo'] as Map<String, dynamic>),
        images: json['images'] as List<dynamic>?,
        files: json['files'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'ref_type': refType,
        'short_description': shortDescription,
        'description': description,
        'transports_type': transportsType,
        'country_id': countryId,
        'state_id': stateId,
        'directorate_id': directorateId,
        'is_default': isDefault,
        'is_public': isPublic,
        'is_active': isActive,
        'status': status,
        'is_published': isPublished,
        'published_at': publishedAt,
        'unpublished_at': unpublishedAt,
        'airline_id': airlineId,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'config_data': configData,
        'other_data': otherData,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image?.toJson(),
        'logo': logo?.toJson(),
        'images': images,
        'files': files,
      };
}
