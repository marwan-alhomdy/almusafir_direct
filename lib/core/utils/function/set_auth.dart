import 'dart:convert';

import '../../../helper/cache_helper.dart';
import '../../../helper/public_infromation.dart';
import '../../constants/cached/cached_name.dart';
import '../../data/models/user_model.module.dart';

void setAuth(UserModel user) {
  Helper.delegate = user.user;
  CacheHelper.setString(CachedAppKey.authToken, user.accessToken ?? "");
  CacheHelper.setBool(CachedAppKey.isAuth, true);
  CacheHelper.setString(
      CachedAppKey.deleagete, json.encode(user.user?.toJson()));
}
