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

  static Map<String, String> get headerWithCloudflare {
    return {
      'authority': 'api.cloudflare.com',
      'Authorization': 'Bearer g9NwqK_lXj8BFpb_JgEaJuhKPK4t9GltksSnZtec'
    };
  }
}
