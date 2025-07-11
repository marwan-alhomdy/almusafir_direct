import '../models/user_object_rating.module.dart';
import 'avatar.dart';

class User {
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
  UserObjectRating? userObjectRating;
  int? favoritesCount;
  int? userIsFavorite;
  int? likesCount;
  int? bookmarksCount;
  int? reactionsCount;
  String? referralAlias;
  String? referralLink;
  String? objectType;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        username: json['username'],
        email: json['email'],
        mobile: json['mobile'],
        gender: json['gender'],
        dateOfBirth: json['date_of_birth'],
        address1: json['address_1'],
        address2: json['address_2'],
        streetName: json['street_name'],
        streetNumber: json['street_number'],
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        // geoComponents: json['geo_components'] as List<dynamic>?,
        city: json['city'],
        zip: json['zip'],
        postcode: json['postcode'],
        countryLong: json['country_long'],
        countryId: json['country_id'],
        stateId: json['state_id'],
        directorateId: json['directorate_id'],
        formataddress: json['formataddress'],
        vicinity: json['vicinity'],
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
        companysId: json['companys_id'],
        departmentsId: json['departments_id'],
        employeesId: json['employees_id'],
        refType: json['ref_type'],
        refId: json['ref_id'],
        permissions: json['permissions'] as List<dynamic>?,
        isGuest: json['is_guest'],
        isSuperuser: json['is_superuser'],
        isActivated: json['is_activated'],
        activatedAt: json['activated_at'],
        lastLogin: json['last_login'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        deletedAt: json['deleted_at'],
        createdIpAddress: json['created_ip_address'],
        lastIpAddress: json['last_ip_address'],
        isBlockedOrders: json['is_blocked_orders'],
        isDelivery: json['is_delivery'],
        provider: json['provider'],
        ordersUserCount: json['orders_user_count'],
        ordersUserCompleteCount: json['orders_user_complete_count'],
        ordersUserCancelledCount: json['orders_user_cancelled_count'],
        ordersUserDeliveryCount: json['orders_user_delivery_count'],
        ordersUserNewCount: json['orders_user_new_count'],
        ordersDeliveryCount: json['orders_delivery_count'],
        ordersDeliveryCompleteCount: json['orders_delivery_complete_count'],
        ordersDeliveryCancelledCount: json['orders_delivery_cancelled_count'],
        ordersDeliveryDeliveryCount: json['orders_delivery_delivery_count'],
        ordersDeliveryNewCount: json['orders_delivery_new_count'],
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
        referralAlias: json['referral_alias'],
        referralLink: json['referral_link'],
        objectType: json['object_type'],
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
        'user_object_rating': userObjectRating?.toJson(),
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
