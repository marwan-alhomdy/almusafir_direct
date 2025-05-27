import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/data/models/delegate.module.dart';
import '../../../../core/error/exception.dart';

abstract class HomeLocalDatasource {
  Future<DelegateModule> getAllDataCached();
  Future<Unit> cacheAllDataData(DelegateModule delegate);
}

class HomeLocalDataSourceImpl implements HomeLocalDatasource {
  final SharedPreferences sharedPreferences;
  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheAllDataData(DelegateModule delegate) {
    final delegateJson = delegate.toJson();
    sharedPreferences.setString(
        CachedAppKey.deleagete, json.encode(delegateJson));
    return Future.value(unit);
  }

  @override
  Future<DelegateModule> getAllDataCached() {
    final jsonString = sharedPreferences.getString(CachedAppKey.deleagete);
    if (jsonString != null) {
      final decodeJson = json.decode(jsonString);
      return Future.value(DelegateModule.fromJson(decodeJson));
    } else {
      throw EmptyCacheException();
    }
  }
}
