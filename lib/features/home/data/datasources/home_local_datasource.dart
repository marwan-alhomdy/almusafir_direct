import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/error/exception.dart';
import '../model/getalldata/primary_data.dart';

abstract class HomeLocalDatasource {
  Future<PrimaryData> getAllDataCached();
  Future<Unit> cacheAllDataData(PrimaryData delegate);
}

class HomeLocalDataSourceImpl implements HomeLocalDatasource {
  final SharedPreferences sharedPreferences;
  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheAllDataData(PrimaryData dataApp) {
    final dataAppJson = dataApp.toJson();
    sharedPreferences.setString(CachedAppKey.dataApp, json.encode(dataAppJson));
    return Future.value(unit);
  }

  @override
  Future<PrimaryData> getAllDataCached() {
    final jsonString = sharedPreferences.getString(CachedAppKey.dataApp);
    if (jsonString != null) {
      final decodeJson = json.decode(jsonString);
      return Future.value(PrimaryData.fromJson(decodeJson));
    } else {
      throw EmptyCacheException();
    }
  }
}
