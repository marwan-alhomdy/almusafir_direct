import 'children.dart';
import 'field_values.dart';
import 'prices_units.dart';
import 'product_options.dart';

class ShopProducts {
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
  int? isOffer;
  String? groupsProductsId;
  String? companysId;
  String? departmentsId;
  String? homeCountryId;
  String? typingCountryId;
  String? companysProductsId;
  int? isEffective;
  int? isDefault;
  int? isActive;
  int? isPublished;
  String? publishedAt;
  String? unpublishedAt;
  int? manageStock;
  int? shopStock;
  int? calories;
  int? minQty;
  int? maxQty;
  int? minQtyInStock;
  int? maxQtyInStock;
  int? defaultQty;
  int? oldPrice;
  int? price;
  String? currencysId;
  String? mainCurrencysId;
  int? isShowOldPrice;
  int? isParleying;
  int? isSold;
  int? isPurchased;
  int? isComposite;
  int? isUnits;
  int? isDownloadable;
  dynamic properties;
  dynamic links;
  dynamic otherData;
  dynamic configData;
  String? status;
  int? sortOrder;
  String? userType;
  String? userId;
  String? createdAt;
  String? updatedAt;
  dynamic image;
  List<dynamic>? images;
  List<dynamic>? files;
  int? tagsTypeId;
  String? displayType;
  String? typeProcess;
  String? useCase;
  int? isShowPrice;
  int? isShowMobile;
  String? mobile;
  int? isShowWhatsapp;
  int? isShowChat;
  int? isShowLocation;
  int? isNeedShipping;
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
  int? latitude;
  int? longitude;
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
  int? qty;
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
  FieldValues? fieldValues;
  String? objectType;
  Children? children;
  PricesUnits? pricesUnits;
  ProductOptions? productOptions;

  ShopProducts({
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

  factory ShopProducts.fromJson(Map<String, dynamic> json) => ShopProducts(
        id: json['id'] as int?,
        code: json['code'] as String?,
        barcode: json['barcode'] as String?,
        name: json['name'] as String?,
        emblem: json['emblem'] as String?,
        shortDescription: json['short_description'] as String?,
        description: json['description'] as String?,
        usersManual: json['users_manual'] as String?,
        composition: json['composition'] as String?,
        indication: json['indication'] as String?,
        metaTitle: json['meta_title'] as String?,
        metaDescription: json['meta_description'] as String?,
        keywords: json['keywords'] as String?,
        refTypeClass: json['ref_type_class'] as String?,
        refKeyValuesClass: json['ref_key_values_class'] as String?,
        isOffer: json['is_offer'] as int?,
        groupsProductsId: json['groups_products_id'] as String?,
        companysId: json['companys_id'] as String?,
        departmentsId: json['departments_id'] as String?,
        homeCountryId: json['home_country_id'] as String?,
        typingCountryId: json['typing_country_id'] as String?,
        companysProductsId: json['companys_products_id'] as String?,
        isEffective: json['is_effective'] as int?,
        isDefault: json['is_default'] as int?,
        isActive: json['is_active'] as int?,
        isPublished: json['is_published'] as int?,
        publishedAt: json['published_at'] as String?,
        unpublishedAt: json['unpublished_at'] as String?,
        manageStock: json['manage_stock'] as int?,
        shopStock: json['shop_stock'] as int?,
        calories: json['calories'] as int?,
        minQty: json['min_qty'] as int?,
        maxQty: json['max_qty'] as int?,
        minQtyInStock: json['min_qty_in_stock'] as int?,
        maxQtyInStock: json['max_qty_in_stock'] as int?,
        defaultQty: json['default_qty'] as int?,
        oldPrice: json['old_price'] as int?,
        price: json['price'] as int?,
        currencysId: json['currencys_id'] as String?,
        mainCurrencysId: json['main_currencys_id'] as String?,
        isShowOldPrice: json['is_show_old_price'] as int?,
        isParleying: json['is_parleying'] as int?,
        isSold: json['is_sold'] as int?,
        isPurchased: json['is_purchased'] as int?,
        isComposite: json['is_composite'] as int?,
        isUnits: json['is_units'] as int?,
        isDownloadable: json['is_downloadable'] as int?,
        properties: json['properties'] as dynamic,
        links: json['links'] as dynamic,
        otherData: json['other_data'] as dynamic,
        configData: json['config_data'] as dynamic,
        status: json['status'] as String?,
        sortOrder: json['sort_order'] as int?,
        userType: json['user_type'] as String?,
        userId: json['user_id'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        image: json['image'] as dynamic,
        images: json['images'] as List<dynamic>?,
        files: json['files'] as List<dynamic>?,
        tagsTypeId: json['tags_type_id'] as int?,
        displayType: json['display_type'] as String?,
        typeProcess: json['type_process'] as String?,
        useCase: json['use_case'] as String?,
        isShowPrice: json['is_show_price'] as int?,
        isShowMobile: json['is_show_mobile'] as int?,
        mobile: json['mobile'] as String?,
        isShowWhatsapp: json['is_show_whatsapp'] as int?,
        isShowChat: json['is_show_chat'] as int?,
        isShowLocation: json['is_show_location'] as int?,
        isNeedShipping: json['is_need_shipping'] as int?,
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        countryId: json['country_id'] as String?,
        countryLong: json['country_long'] as String?,
        city: json['city'] as String?,
        stateId: json['state_id'] as String?,
        directorateId: json['directorate_id'] as String?,
        streetName: json['street_name'] as String?,
        streetNumber: json['street_number'] as String?,
        radius: json['radius'] as String?,
        latitude: json['latitude'] as int?,
        longitude: json['longitude'] as int?,
        zip: json['zip'] as String?,
        postcode: json['postcode'] as String?,
        formataddress: json['formataddress'] as String?,
        vicinity: json['vicinity'] as String?,
        geoComponents: json['geo_components'] as dynamic,
        passportType: json['passport_type'] as String?,
        passportNumber: json['passport_number'] as String?,
        passportReleaseAt: json['passport_release_at'] as String?,
        passportExpiryAt: json['passport_expiry_at'] as String?,
        instrumentNumber: json['instrument_number'] as String?,
        advertLicenseNumber: json['advert_license_number'] as String?,
        fromDateAt: json['from_date_at'] as String?,
        toDateAt: json['to_date_at'] as String?,
        qty: json['qty'] as int?,
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
        fieldValues: json['field_values'] == null
            ? null
            : FieldValues.fromJson(
                json['field_values'] as Map<String, dynamic>),
        objectType: json['object_type'] as String?,
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
        'image': image,
        'images': images,
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
