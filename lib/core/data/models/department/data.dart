import '../email.dart';
import '../image.dart';
import '../phone.dart';
import '../user_object_rating.module.dart';
import '../working_hours/working_hours.module.dart';
import 'website.dart';

class ShoppingDepartment {
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
  num? isDefault;
  num? isHidden;
  num? isActive;
  String? mainSub;
  String? parentId;
  num? level;
  String? tagsTypeId;
  String? sector;
  String? facilitySize;
  num? employeesFrom;
  num? employeesTo;
  dynamic links;
  dynamic properties;
  num? sortOrder;
  String? createdAt;
  String? updatedAt;
  ImageModel? image;
  List<ImageModel>? images;
  List<dynamic>? files;
  num? isFreeShipping;
  num? customShippingInShop;
  num? isFirstOrderShopFree;
  num? isStopDelivery;
  num? isExtentOfDelivery;
  num? extentOfDelivery;
  String? deliveryFromAt;
  String? deliveryToAt;
  String? deliveryAt;
  num? ratingsCount;
  num? countRating;
  num? sumRating;
  num? averageRating;
  num? userIsRating;
  UserObjectRating? userObjectRating;
  num? favoritesCount;
  num? userIsFavorite;
  num? likesCount;
  num? bookmarksCount;
  num? reactionsCount;
  String? objectType;
  int? isOpen;
  WorkingHoursModule? workingHours;

  ShoppingDepartment({
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
    this.isOpen,
    this.workingHours,
  });

  factory ShoppingDepartment.fromJson(Map<String, dynamic> json) =>
      ShoppingDepartment(
        id: json['id'],
        code: json['code'],
        name: json['name'],
        shortDescription: json['short_description'],
        description: json['description'],
        metaTitle: json['meta_title'],
        metaDescription: json['meta_description'],
        keywords: json['keywords'],
        businessNumber: json['business_number'],
        vatNumber: json['vat_number'],
        mobile: json['mobile'],
        phone: (json['phone'] as List<dynamic>?)
            ?.map((e) => PhoneModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        email: (json['email'] as List<dynamic>?)
            ?.map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        website: (json['website'] as List<dynamic>?)
            ?.map((e) => Website.fromJson(e as Map<String, dynamic>))
            .toList(),
        companysId: json['companys_id'],
        address: json['address'],
        address1: json['address_1'],
        address2: json['address_2'],
        streetName: json['street_name'],
        streetNumber: json['street_number'],
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        geoComponents: json['geo_components'] as List<dynamic>?,
        city: json['city'],
        zip: json['zip'],
        postcode: json['postcode'],
        countryLong: json['country_long'],
        countryId: json['country_id'],
        stateId: json['state_id'],
        directorateId: json['directorate_id'],
        formataddress: json['formataddress'],
        vicinity: json['vicinity'],
        isDefault: json['is_default'],
        isHidden: json['is_hidden'],
        isActive: json['is_active'],
        mainSub: json['main_sub'],
        parentId: json['parent_id'],
        level: json['level'],
        tagsTypeId: json['tags_type_id'],
        sector: json['sector'],
        facilitySize: json['facility_size'],
        employeesFrom: json['employees_from'],
        employeesTo: json['employees_to'],
        // links: json['links'] as dynamic,
        // properties: json['properties'] as dynamic,
        sortOrder: json['sort_order'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        // files: json['files'] as List<dynamic>?,
        isFreeShipping: json['is_free_shipping'],
        customShippingInShop: json['custom_shipping_in_shop'],
        isFirstOrderShopFree: json['is_first_order_shop_free'],
        isStopDelivery: json['is_stop_delivery'],
        isExtentOfDelivery: json['is_extent_of_delivery'],
        extentOfDelivery: json['extent_of_delivery'],
        deliveryFromAt: json['delivery_from_at'],
        deliveryToAt: json['delivery_to_at'],
        deliveryAt: json['delivery_at'],
        ratingsCount: json['ratings_count'],
        countRating: json['countRating'],
        sumRating: json['sumRating'],
        averageRating: json['averageRating'],
        userIsRating: json['user_is_rating'],
        userObjectRating: json['user_object_rating'] == null
            ? null
            : UserObjectRating.fromJson(
                json['user_object_rating'] as Map<String, dynamic>),
        favoritesCount: json['favorites_count'],
        userIsFavorite: json['user_is_favorite'],
        likesCount: json['likes_count'],
        bookmarksCount: json['bookmarks_count'],
        reactionsCount: json['reactions_count'],
        isOpen: json['is_opened'],
        objectType: json['object_type'],
        workingHours: json['working_hours'] == null
            ? null
            : WorkingHoursModule.fromJson(
                json['working_hours'] as Map<String, dynamic>),
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
        'images': images?.map((e) => e.toJson()).toList(),
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
        'user_object_rating': userObjectRating?.toJson(),
        'favorites_count': favoritesCount,
        'user_is_favorite': userIsFavorite,
        'likes_count': likesCount,
        'bookmarks_count': bookmarksCount,
        'reactions_count': reactionsCount,
        'object_type': objectType,
        'is_opened': isOpen,
        'working_hours': workingHours?.toJson(),
      };
}
