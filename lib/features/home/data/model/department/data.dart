import '../../../../../core/data/models/email.dart';
import '../../../../../core/data/models/image.dart';
import '../../../../../core/data/models/phone.dart';
import 'website.dart';

class Data {
  int? id;
  String? code;
  String? name;
  String? shortDescription;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? keywords;
  String? businessNumber;
  String? vatNumber;
  String? mobile;
  List<PhoneModel>? phone;
  List<EmailModel>? email;
  List<Website>? website;
  String? companysId;
  String? address;
  String? address1;
  String? address2;
  String? streetName;
  String? streetNumber;
  double? latitude;
  double? longitude;
  List<dynamic>? geoComponents;
  String? city;
  String? zip;
  String? postcode;
  String? countryLong;
  String? countryId;
  String? stateId;
  String? directorateId;
  String? formataddress;
  String? vicinity;
  int? isDefault;
  int? isHidden;
  int? isActive;
  String? mainSub;
  String? parentId;
  int? level;
  String? tagsTypeId;
  String? sector;
  String? facilitySize;
  int? employeesFrom;
  int? employeesTo;
  dynamic links;
  dynamic properties;
  int? sortOrder;
  String? createdAt;
  String? updatedAt;
  ImageModel? image;
  List<dynamic>? images;
  List<dynamic>? files;
  int? isFreeShipping;
  int? customShippingInShop;
  int? isFirstOrderShopFree;
  int? isStopDelivery;
  int? isExtentOfDelivery;
  int? extentOfDelivery;
  String? deliveryFromAt;
  String? deliveryToAt;
  String? deliveryAt;
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

  Data({
    this.id,
    this.code,
    this.name,
    this.shortDescription,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.keywords,
    this.businessNumber,
    this.vatNumber,
    this.mobile,
    this.phone,
    this.email,
    this.website,
    this.companysId,
    this.address,
    this.address1,
    this.address2,
    this.streetName,
    this.streetNumber,
    this.latitude,
    this.longitude,
    this.geoComponents,
    this.city,
    this.zip,
    this.postcode,
    this.countryLong,
    this.countryId,
    this.stateId,
    this.directorateId,
    this.formataddress,
    this.vicinity,
    this.isDefault,
    this.isHidden,
    this.isActive,
    this.mainSub,
    this.parentId,
    this.level,
    this.tagsTypeId,
    this.sector,
    this.facilitySize,
    this.employeesFrom,
    this.employeesTo,
    this.links,
    this.properties,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.images,
    this.files,
    this.isFreeShipping,
    this.customShippingInShop,
    this.isFirstOrderShopFree,
    this.isStopDelivery,
    this.isExtentOfDelivery,
    this.extentOfDelivery,
    this.deliveryFromAt,
    this.deliveryToAt,
    this.deliveryAt,
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        code: json['code'] as String?,
        name: json['name'] as String?,
        shortDescription: json['short_description'] as String?,
        description: json['description'] as String?,
        metaTitle: json['meta_title'] as String?,
        metaDescription: json['meta_description'] as String?,
        keywords: json['keywords'] as String?,
        businessNumber: json['business_number'] as String?,
        vatNumber: json['vat_number'] as String?,
        mobile: json['mobile'] as String?,
        phone: (json['phone'] as List<dynamic>?)
            ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        email: (json['email'] as List<dynamic>?)
            ?.map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        website: (json['website'] as List<dynamic>?)
            ?.map((e) => Website.fromJson(e as Map<String, dynamic>))
            .toList(),
        companysId: json['companys_id'] as String?,
        address: json['address'] as String?,
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        streetName: json['street_name'] as String?,
        streetNumber: json['street_number'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        geoComponents: json['geo_components'] as List<dynamic>?,
        city: json['city'] as String?,
        zip: json['zip'] as String?,
        postcode: json['postcode'] as String?,
        countryLong: json['country_long'] as String?,
        countryId: json['country_id'] as String?,
        stateId: json['state_id'] as String?,
        directorateId: json['directorate_id'] as String?,
        formataddress: json['formataddress'] as String?,
        vicinity: json['vicinity'] as String?,
        isDefault: json['is_default'] as int?,
        isHidden: json['is_hidden'] as int?,
        isActive: json['is_active'] as int?,
        mainSub: json['main_sub'] as String?,
        parentId: json['parent_id'] as String?,
        level: json['level'] as int?,
        tagsTypeId: json['tags_type_id'] as String?,
        sector: json['sector'] as String?,
        facilitySize: json['facility_size'] as String?,
        employeesFrom: json['employees_from'] as int?,
        employeesTo: json['employees_to'] as int?,
        links: json['links'] as dynamic,
        properties: json['properties'] as dynamic,
        sortOrder: json['sort_order'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        images: json['images'] as List<dynamic>?,
        files: json['files'] as List<dynamic>?,
        isFreeShipping: json['is_free_shipping'] as int?,
        customShippingInShop: json['custom_shipping_in_shop'] as int?,
        isFirstOrderShopFree: json['is_first_order_shop_free'] as int?,
        isStopDelivery: json['is_stop_delivery'] as int?,
        isExtentOfDelivery: json['is_extent_of_delivery'] as int?,
        extentOfDelivery: json['extent_of_delivery'] as int?,
        deliveryFromAt: json['delivery_from_at'] as String?,
        deliveryToAt: json['delivery_to_at'] as String?,
        deliveryAt: json['delivery_at'] as String?,
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
        'name': name,
        'short_description': shortDescription,
        'description': description,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'keywords': keywords,
        'business_number': businessNumber,
        'vat_number': vatNumber,
        'mobile': mobile,
        'phone': phone?.map((e) => e.toJson()).toList(),
        'email': email?.map((e) => e.toJson()).toList(),
        'website': website?.map((e) => e.toJson()).toList(),
        'companys_id': companysId,
        'address': address,
        'address_1': address1,
        'address_2': address2,
        'street_name': streetName,
        'street_number': streetNumber,
        'latitude': latitude,
        'longitude': longitude,
        'geo_components': geoComponents,
        'city': city,
        'zip': zip,
        'postcode': postcode,
        'country_long': countryLong,
        'country_id': countryId,
        'state_id': stateId,
        'directorate_id': directorateId,
        'formataddress': formataddress,
        'vicinity': vicinity,
        'is_default': isDefault,
        'is_hidden': isHidden,
        'is_active': isActive,
        'main_sub': mainSub,
        'parent_id': parentId,
        'level': level,
        'tags_type_id': tagsTypeId,
        'sector': sector,
        'facility_size': facilitySize,
        'employees_from': employeesFrom,
        'employees_to': employeesTo,
        'links': links,
        'properties': properties,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image?.toJson(),
        'images': images,
        'files': files,
        'is_free_shipping': isFreeShipping,
        'custom_shipping_in_shop': customShippingInShop,
        'is_first_order_shop_free': isFirstOrderShopFree,
        'is_stop_delivery': isStopDelivery,
        'is_extent_of_delivery': isExtentOfDelivery,
        'extent_of_delivery': extentOfDelivery,
        'delivery_from_at': deliveryFromAt,
        'delivery_to_at': deliveryToAt,
        'delivery_at': deliveryAt,
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
