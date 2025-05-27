import 'config_data.dart';
import 'image.dart';

class Datum {
  int? id;
  String? code;
  String? barcode;
  String? slug;
  String? name;
  String? title;
  String? subTitle;
  String? link;
  String? shortDescription;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? keywords;
  String? type;
  String? typeProcess;
  String? categoriesId;
  String? companysId;
  String? departmentsId;
  int? isEffective;
  int? isDefault;
  int? isActive;
  int? isPublished;
  String? publishedAt;
  String? unpublishedAt;
  List<dynamic>? phone;
  List<dynamic>? email;
  List<dynamic>? website;
  List<dynamic>? properties;
  List<dynamic>? links;
  List<dynamic>? otherData;
  ConfigData? configData;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;
  Image? image;
  List<dynamic>? images;
  List<dynamic>? files;
  int? ratingsCount;
  int? countRating;
  int? sumRating;
  int? averageRating;
  int? userIsRating;
  dynamic userObjectRating;
  int? favoritesCount;
  int? userIsFavorite;
  int? likesCount;
  int? bookmarksCount;
  int? reactionsCount;
  String? objectType;

  Datum({
    this.id,
    this.code,
    this.barcode,
    this.slug,
    this.name,
    this.title,
    this.subTitle,
    this.link,
    this.shortDescription,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.keywords,
    this.type,
    this.typeProcess,
    this.categoriesId,
    this.companysId,
    this.departmentsId,
    this.isEffective,
    this.isDefault,
    this.isActive,
    this.isPublished,
    this.publishedAt,
    this.unpublishedAt,
    this.phone,
    this.email,
    this.website,
    this.properties,
    this.links,
    this.otherData,
    this.configData,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.images,
    this.files,
    this.ratingsCount,
    this.countRating,
    this.sumRating,
    this.averageRating,
    this.userIsRating,
    this.userObjectRating,
    this.favoritesCount,
    this.userIsFavorite,
    this.likesCount,
    this.bookmarksCount,
    this.reactionsCount,
    this.objectType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        code: json['code'] as String?,
        barcode: json['barcode'] as String?,
        slug: json['slug'] as String?,
        name: json['name'] as String?,
        title: json['title'] as String?,
        subTitle: json['sub_title'] as String?,
        link: json['link'] as String?,
        shortDescription: json['short_description'] as String?,
        description: json['description'] as String?,
        metaTitle: json['meta_title'] as String?,
        metaDescription: json['meta_description'] as String?,
        keywords: json['keywords'] as String?,
        type: json['type'] as String?,
        typeProcess: json['type_process'] as String?,
        categoriesId: json['categories_id'] as String?,
        companysId: json['companys_id'] as String?,
        departmentsId: json['departments_id'] as String?,
        isEffective: json['is_effective'] as int?,
        isDefault: json['is_default'] as int?,
        isActive: json['is_active'] as int?,
        isPublished: json['is_published'] as int?,
        publishedAt: json['published_at'] as String?,
        unpublishedAt: json['unpublished_at'] as String?,
        phone: json['phone'] as List<dynamic>?,
        email: json['email'] as List<dynamic>?,
        website: json['website'] as List<dynamic>?,
        properties: json['properties'] as List<dynamic>?,
        links: json['links'] as List<dynamic>?,
        otherData: json['other_data'] as List<dynamic>?,
        configData: json['config_data'] == null
            ? null
            : ConfigData.fromJson(json['config_data'] as Map<String, dynamic>),
        sortOrder: json['sort_order'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        images: json['images'] as List<dynamic>?,
        files: json['files'] as List<dynamic>?,
        ratingsCount: json['ratings_count'] as int?,
        countRating: json['countRating'] as int?,
        sumRating: json['sumRating'] as int?,
        averageRating: json['averageRating'] as int?,
        userIsRating: json['user_is_rating'] as int?,
        userObjectRating: json['user_object_rating'] as dynamic,
        favoritesCount: json['favorites_count'] as int?,
        userIsFavorite: json['user_is_favorite'] as int?,
        likesCount: json['likes_count'] as int?,
        bookmarksCount: json['bookmarks_count'] as int?,
        reactionsCount: json['reactions_count'] as int?,
        objectType: json['object_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'barcode': barcode,
        'slug': slug,
        'name': name,
        'title': title,
        'sub_title': subTitle,
        'link': link,
        'short_description': shortDescription,
        'description': description,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'keywords': keywords,
        'type': type,
        'type_process': typeProcess,
        'categories_id': categoriesId,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'is_effective': isEffective,
        'is_default': isDefault,
        'is_active': isActive,
        'is_published': isPublished,
        'published_at': publishedAt,
        'unpublished_at': unpublishedAt,
        'phone': phone,
        'email': email,
        'website': website,
        'properties': properties,
        'links': links,
        'other_data': otherData,
        'config_data': configData?.toJson(),
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image?.toJson(),
        'images': images,
        'files': files,
        'ratings_count': ratingsCount,
        'countRating': countRating,
        'sumRating': sumRating,
        'averageRating': averageRating,
        'user_is_rating': userIsRating,
        'user_object_rating': userObjectRating,
        'favorites_count': favoritesCount,
        'user_is_favorite': userIsFavorite,
        'likes_count': likesCount,
        'bookmarks_count': bookmarksCount,
        'reactions_count': reactionsCount,
        'object_type': objectType,
      };
}
