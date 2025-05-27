import 'avatar.dart';

class Data {
  int? id;
  String? name;
  String? surname;
  String? username;
  String? email;
  String? mobile;
  String? gender;
  String? dateOfBirth;
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
  Avatar? avatar;
  String? companysId;
  String? departmentsId;
  String? employeesId;
  String? refType;
  String? refId;
  List<dynamic>? permissions;
  int? isGuest;
  int? isSuperuser;
  int? isActivated;
  String? activatedAt;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? createdIpAddress;
  String? lastIpAddress;
  int? isBlockedOrders;
  int? isDelivery;
  String? provider;
  int? ordersUserCount;
  int? ordersUserCompleteCount;
  int? ordersUserCancelledCount;
  int? ordersUserDeliveryCount;
  int? ordersUserNewCount;
  int? ordersDeliveryCount;
  int? ordersDeliveryCompleteCount;
  int? ordersDeliveryCancelledCount;
  int? ordersDeliveryDeliveryCount;
  int? ordersDeliveryNewCount;
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
  String? referralAlias;
  String? referralLink;
  String? objectType;

  Data({
    this.id,
    this.name,
    this.surname,
    this.username,
    this.email,
    this.mobile,
    this.gender,
    this.dateOfBirth,
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
    this.avatar,
    this.companysId,
    this.departmentsId,
    this.employeesId,
    this.refType,
    this.refId,
    this.permissions,
    this.isGuest,
    this.isSuperuser,
    this.isActivated,
    this.activatedAt,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdIpAddress,
    this.lastIpAddress,
    this.isBlockedOrders,
    this.isDelivery,
    this.provider,
    this.ordersUserCount,
    this.ordersUserCompleteCount,
    this.ordersUserCancelledCount,
    this.ordersUserDeliveryCount,
    this.ordersUserNewCount,
    this.ordersDeliveryCount,
    this.ordersDeliveryCompleteCount,
    this.ordersDeliveryCancelledCount,
    this.ordersDeliveryDeliveryCount,
    this.ordersDeliveryNewCount,
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
    this.referralAlias,
    this.referralLink,
    this.objectType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        surname: json['surname'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        gender: json['gender'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
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
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
        companysId: json['companys_id'] as String?,
        departmentsId: json['departments_id'] as String?,
        employeesId: json['employees_id'] as String?,
        refType: json['ref_type'] as String?,
        refId: json['ref_id'] as String?,
        permissions: json['permissions'] as List<dynamic>?,
        isGuest: json['is_guest'] as int?,
        isSuperuser: json['is_superuser'] as int?,
        isActivated: json['is_activated'] as int?,
        activatedAt: json['activated_at'] as String?,
        lastLogin: json['last_login'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        deletedAt: json['deleted_at'] as String?,
        createdIpAddress: json['created_ip_address'] as String?,
        lastIpAddress: json['last_ip_address'] as String?,
        isBlockedOrders: json['is_blocked_orders'] as int?,
        isDelivery: json['is_delivery'] as int?,
        provider: json['provider'] as String?,
        ordersUserCount: json['orders_user_count'] as int?,
        ordersUserCompleteCount: json['orders_user_complete_count'] as int?,
        ordersUserCancelledCount: json['orders_user_cancelled_count'] as int?,
        ordersUserDeliveryCount: json['orders_user_delivery_count'] as int?,
        ordersUserNewCount: json['orders_user_new_count'] as int?,
        ordersDeliveryCount: json['orders_delivery_count'] as int?,
        ordersDeliveryCompleteCount:
            json['orders_delivery_complete_count'] as int?,
        ordersDeliveryCancelledCount:
            json['orders_delivery_cancelled_count'] as int?,
        ordersDeliveryDeliveryCount:
            json['orders_delivery_delivery_count'] as int?,
        ordersDeliveryNewCount: json['orders_delivery_new_count'] as int?,
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
        referralAlias: json['referral_alias'] as String?,
        referralLink: json['referral_link'] as String?,
        objectType: json['object_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'username': username,
        'email': email,
        'mobile': mobile,
        'gender': gender,
        'date_of_birth': dateOfBirth,
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
        'avatar': avatar?.toJson(),
        'companys_id': companysId,
        'departments_id': departmentsId,
        'employees_id': employeesId,
        'ref_type': refType,
        'ref_id': refId,
        'permissions': permissions,
        'is_guest': isGuest,
        'is_superuser': isSuperuser,
        'is_activated': isActivated,
        'activated_at': activatedAt,
        'last_login': lastLogin,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'created_ip_address': createdIpAddress,
        'last_ip_address': lastIpAddress,
        'is_blocked_orders': isBlockedOrders,
        'is_delivery': isDelivery,
        'provider': provider,
        'orders_user_count': ordersUserCount,
        'orders_user_complete_count': ordersUserCompleteCount,
        'orders_user_cancelled_count': ordersUserCancelledCount,
        'orders_user_delivery_count': ordersUserDeliveryCount,
        'orders_user_new_count': ordersUserNewCount,
        'orders_delivery_count': ordersDeliveryCount,
        'orders_delivery_complete_count': ordersDeliveryCompleteCount,
        'orders_delivery_cancelled_count': ordersDeliveryCancelledCount,
        'orders_delivery_delivery_count': ordersDeliveryDeliveryCount,
        'orders_delivery_new_count': ordersDeliveryNewCount,
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
        'referral_alias': referralAlias,
        'referral_link': referralLink,
        'object_type': objectType,
      };
}
