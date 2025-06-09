import 'dart:io' show Platform;

import '../../helper/cache_helper.dart';
import '../constants/cached/cached_name.dart';

class HeaderServer {
  static Map<String, String> get header {
    return {
      'Content-Type': 'application/json',
      "api_version": "v2",
      'User-Agent': Platform.isIOS ? 'ios' : 'android',
    };
  }

  static Map<String, String> get headerWithToken {
    final token = CacheHelper.getString(CachedAppKey.authToken);
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      "api_version": "v2",
      'User-Agent': Platform.isIOS ? 'ios' : 'android',
    };
  }

  static Map<String, String> get headerFile {
    return {
      "content-type": "multipart/form-data",
      "api_version": "v2",
      'User-Agent': Platform.isIOS ? 'ios' : 'android',
    };
  }

  static Map<String, String> get headerWithTokenFile {
    final token = CacheHelper.getString(CachedAppKey.authToken);
    return {
      'Authorization': 'Bearer $token',
      "content-type": "multipart/form-data",
      "api_version": "v2",
      'User-Agent': Platform.isIOS ? 'ios' : 'android',
    };
  }
}
