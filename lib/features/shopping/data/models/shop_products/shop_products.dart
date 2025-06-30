import 'package:almusafir_direct/core/data/models/image.dart';

import 'children.dart';
import 'field_values.dart';
import 'prices_units.dart';
import 'product_options.dart';

class ShopProduct {
  int? id;
  String? code;
  String? barcode;
  String? name;
  String? emblem;
  String? shortDescription;
  String? description;
  String? usersManual;
  String? composition;
  String? indication;
  String? metaTitle;
  String? metaDescription;
  String? keywords;
  String? refTypeClass;
  String? refKeyValuesClass;
  num? isOffer;
  String? groupsProductsId;
  String? companysId;
  String? departmentsId;
  String? homeCountryId;
  String? typingCountryId;
  String? companysProductsId;
  num? isEffective;
  num? isDefault;
  num? isActive;
  num? isPublished;
  String? publishedAt;
  String? unpublishedAt;
  num? manageStock;
  num? shopStock;
  num? calories;
  num? minQty;
  num? maxQty;
  num? minQtyInStock;
  num? maxQtyInStock;
  num? defaultQty;
  num? oldPrice;
  num? price;
  String? currencysId;
  String? mainCurrencysId;
  num? isShowOldPrice;
  num? isParleying;
  num? isSold;
  num? isPurchased;
  num? isComposite;
  num? isUnits;
  num? isDownloadable;
  dynamic properties;
  dynamic links;
  dynamic otherData;
  dynamic configData;
  String? status;
  num? sortOrder;
  String? userType;
  String? userId;
  String? createdAt;
  String? updatedAt;
  ImageModel? image;
  List<ImageModel>? images;
  List<dynamic>? files;
  num? tagsTypeId;
  String? displayType;
  String? typeProcess;
  String? useCase;
  num? isShowPrice;
  num? isShowMobile;
  String? mobile;
  num? isShowWhatsapp;
  num? isShowChat;
  num? isShowLocation;
  num? isNeedShipping;
  String? address1;
  String? address2;
  String? countryId;
  String? countryLong;
  String? city;
  String? stateId;
  String? directorateId;
  String? streetName;
  String? streetNumber;
  String? radius;
  num? latitude;
  num? longitude;
  String? zip;
  String? postcode;
  String? formataddress;
  String? vicinity;
  dynamic geoComponents;
  String? passportType;
  String? passportNumber;
  String? passportReleaseAt;
  String? passportExpiryAt;
  String? instrumentNumber;
  String? advertLicenseNumber;
  String? fromDateAt;
  String? toDateAt;
  num? qty;
  num? ratingsCount;
  num? countRating;
  num? sumRating;
  num? averageRating;
  num? userIsRating;
  dynamic userObjectRating;
  num? favoritesCount;
  num? userIsFavorite;
  num? likesCount;
  num? bookmarksCount;
  num? reactionsCount;
  FieldValues? fieldValues;
  String? objectType;
  Children? children;
  PricesUnits? pricesUnits;
  ProductOptions? productOptions;

  ShopProduct({
    this.id,
    this.code,
    this.barcode,
    this.name,
    this.emblem,
    this.shortDescription,
    this.description,
    this.usersManual,
    this.composition,
    this.indication,
    this.metaTitle,
    this.metaDescription,
    this.keywords,
    this.refTypeClass,
    this.refKeyValuesClass,
    this.isOffer,
    this.groupsProductsId,
    this.companysId,
    this.departmentsId,
    this.homeCountryId,
    this.typingCountryId,
    this.companysProductsId,
    this.isEffective,
    this.isDefault,
    this.isActive,
    this.isPublished,
    this.publishedAt,
    this.unpublishedAt,
    this.manageStock,
    this.shopStock,
    this.calories,
    this.minQty,
    this.maxQty,
    this.minQtyInStock,
    this.maxQtyInStock,
    this.defaultQty,
    this.oldPrice,
    this.price,
    this.currencysId,
    this.mainCurrencysId,
    this.isShowOldPrice,
    this.isParleying,
    this.isSold,
    this.isPurchased,
    this.isComposite,
    this.isUnits,
    this.isDownloadable,
    this.properties,
    this.links,
    this.otherData,
    this.configData,
    this.status,
    this.sortOrder,
    this.userType,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.images,
    this.files,
    this.tagsTypeId,
    this.displayType,
    this.typeProcess,
    this.useCase,
    this.isShowPrice,
    this.isShowMobile,
    this.mobile,
    this.isShowWhatsapp,
    this.isShowChat,
    this.isShowLocation,
    this.isNeedShipping,
    this.address1,
    this.address2,
    this.countryId,
    this.countryLong,
    this.city,
    this.stateId,
    this.directorateId,
    this.streetName,
    this.streetNumber,
    this.radius,
    this.latitude,
    this.longitude,
    this.zip,
    this.postcode,
    this.formataddress,
    this.vicinity,
    this.geoComponents,
    this.passportType,
    this.passportNumber,
    this.passportReleaseAt,
    this.passportExpiryAt,
    this.instrumentNumber,
    this.advertLicenseNumber,
    this.fromDateAt,
    this.toDateAt,
    this.qty,
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
    this.fieldValues,
    this.objectType,
    this.children,
    this.pricesUnits,
    this.productOptions,
  });

  factory ShopProduct.fromJson(Map<String, dynamic> json) => ShopProduct(
        id: json['id'],
        code: json['code'],
        barcode: json['barcode'],
        name: json['name'],
        emblem: json['emblem'],
        shortDescription: json['short_description'],
        description: json['description'],
        usersManual: json['users_manual'],
        composition: json['composition'],
        indication: json['indication'],
        metaTitle: json['meta_title'],
        metaDescription: json['meta_description'],
        keywords: json['keywords'],
        refTypeClass: json['ref_type_class'],
        refKeyValuesClass: json['ref_key_values_class'],
        isOffer: json['is_offer'],
        groupsProductsId: json['groups_products_id'],
        companysId: json['companys_id'],
        departmentsId: json['departments_id'],
        homeCountryId: json['home_country_id'],
        typingCountryId: json['typing_country_id'],
        companysProductsId: json['companys_products_id'],
        isEffective: json['is_effective'],
        isDefault: json['is_default'],
        isActive: json['is_active'],
        isPublished: json['is_published'],
        publishedAt: json['published_at'],
        unpublishedAt: json['unpublished_at'],
        manageStock: json['manage_stock'],
        shopStock: json['shop_stock'],
        calories: json['calories'],
        minQty: json['min_qty'],
        maxQty: json['max_qty'],
        minQtyInStock: json['min_qty_in_stock'],
        maxQtyInStock: json['max_qty_in_stock'],
        defaultQty: json['default_qty'],
        oldPrice: json['old_price'],
        price: json['price'],
        currencysId: json['currencys_id'],
        mainCurrencysId: json['main_currencys_id'],
        isShowOldPrice: json['is_show_old_price'],
        isParleying: json['is_parleying'],
        isSold: json['is_sold'],
        isPurchased: json['is_purchased'],
        isComposite: json['is_composite'],
        isUnits: json['is_units'],
        isDownloadable: json['is_downloadable'],
        properties: json['properties'],
        links: json['links'],
        otherData: json['other_data'],
        configData: json['config_data'],
        status: json['status'],
        sortOrder: json['sort_order'],
        userType: json['user_type'],
        userId: json['user_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        image: json['image'] == null
            ? null
            : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        files: json['files'] as List<dynamic>?,
        tagsTypeId: json['tags_type_id'],
        displayType: json['display_type'],
        typeProcess: json['type_process'],
        useCase: json['use_case'],
        isShowPrice: json['is_show_price'],
        isShowMobile: json['is_show_mobile'],
        mobile: json['mobile'],
        isShowWhatsapp: json['is_show_whatsapp'],
        isShowChat: json['is_show_chat'],
        isShowLocation: json['is_show_location'],
        isNeedShipping: json['is_need_shipping'],
        address1: json['address_1'],
        address2: json['address_2'],
        countryId: json['country_id'],
        countryLong: json['country_long'],
        city: json['city'],
        stateId: json['state_id'],
        directorateId: json['directorate_id'],
        streetName: json['street_name'],
        streetNumber: json['street_number'],
        radius: json['radius'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        zip: json['zip'],
        postcode: json['postcode'],
        formataddress: json['formataddress'],
        vicinity: json['vicinity'],
        geoComponents: json['geo_components'],
        passportType: json['passport_type'],
        passportNumber: json['passport_number'],
        passportReleaseAt: json['passport_release_at'],
        passportExpiryAt: json['passport_expiry_at'],
        instrumentNumber: json['instrument_number'],
        advertLicenseNumber: json['advert_license_number'],
        fromDateAt: json['from_date_at'],
        toDateAt: json['to_date_at'],
        qty: json['qty'],
        ratingsCount: json['ratings_count'],
        countRating: json['countRating'],
        sumRating: json['sumRating'],
        averageRating: json['averageRating'],
        userIsRating: json['user_is_rating'],
        userObjectRating: json['user_object_rating'],
        favoritesCount: json['favorites_count'],
        userIsFavorite: json['user_is_favorite'],
        likesCount: json['likes_count'],
        bookmarksCount: json['bookmarks_count'],
        reactionsCount: json['reactions_count'],
        fieldValues: json['field_values'] == null
            ? null
            : FieldValues.fromJson(
                json['field_values'] as Map<String, dynamic>),
        objectType: json['object_type'],
        children: json['children'] == null
            ? null
            : Children.fromJson(json['children'] as Map<String, dynamic>),
        pricesUnits: json['prices_units'] == null
            ? null
            : PricesUnits.fromJson(
                json['prices_units'] as Map<String, dynamic>),
        productOptions: json['product_options'] == null
            ? null
            : ProductOptions.fromJson(
                json['product_options'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'barcode': barcode,
        'name': name,
        'emblem': emblem,
        'short_description': shortDescription,
        'description': description,
        'users_manual': usersManual,
        'composition': composition,
        'indication': indication,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'keywords': keywords,
        'ref_type_class': refTypeClass,
        'ref_key_values_class': refKeyValuesClass,
        'is_offer': isOffer,
        'groups_products_id': groupsProductsId,
        'companys_id': companysId,
        'departments_id': departmentsId,
        'home_country_id': homeCountryId,
        'typing_country_id': typingCountryId,
        'companys_products_id': companysProductsId,
        'is_effective': isEffective,
        'is_default': isDefault,
        'is_active': isActive,
        'is_published': isPublished,
        'published_at': publishedAt,
        'unpublished_at': unpublishedAt,
        'manage_stock': manageStock,
        'shop_stock': shopStock,
        'calories': calories,
        'min_qty': minQty,
        'max_qty': maxQty,
        'min_qty_in_stock': minQtyInStock,
        'max_qty_in_stock': maxQtyInStock,
        'default_qty': defaultQty,
        'old_price': oldPrice,
        'price': price,
        'currencys_id': currencysId,
        'main_currencys_id': mainCurrencysId,
        'is_show_old_price': isShowOldPrice,
        'is_parleying': isParleying,
        'is_sold': isSold,
        'is_purchased': isPurchased,
        'is_composite': isComposite,
        'is_units': isUnits,
        'is_downloadable': isDownloadable,
        'properties': properties,
        'links': links,
        'other_data': otherData,
        'config_data': configData,
        'status': status,
        'sort_order': sortOrder,
        'user_type': userType,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image?.toJson(),
        'images': images?.map((e) => e.toJson()).toList(),
        'files': files,
        'tags_type_id': tagsTypeId,
        'display_type': displayType,
        'type_process': typeProcess,
        'use_case': useCase,
        'is_show_price': isShowPrice,
        'is_show_mobile': isShowMobile,
        'mobile': mobile,
        'is_show_whatsapp': isShowWhatsapp,
        'is_show_chat': isShowChat,
        'is_show_location': isShowLocation,
        'is_need_shipping': isNeedShipping,
        'address_1': address1,
        'address_2': address2,
        'country_id': countryId,
        'country_long': countryLong,
        'city': city,
        'state_id': stateId,
        'directorate_id': directorateId,
        'street_name': streetName,
        'street_number': streetNumber,
        'radius': radius,
        'latitude': latitude,
        'longitude': longitude,
        'zip': zip,
        'postcode': postcode,
        'formataddress': formataddress,
        'vicinity': vicinity,
        'geo_components': geoComponents,
        'passport_type': passportType,
        'passport_number': passportNumber,
        'passport_release_at': passportReleaseAt,
        'passport_expiry_at': passportExpiryAt,
        'instrument_number': instrumentNumber,
        'advert_license_number': advertLicenseNumber,
        'from_date_at': fromDateAt,
        'to_date_at': toDateAt,
        'qty': qty,
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
        'field_values': fieldValues?.toJson(),
        'object_type': objectType,
        'children': children?.toJson(),
        'prices_units': pricesUnits?.toJson(),
        'product_options': productOptions?.toJson(),
      };
}
