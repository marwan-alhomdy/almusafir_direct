import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/cached/cached_name.dart';
import '../../../../core/error/exception.dart';
import '../model/getalldata/getalldata.dart';

abstract class HomeLocalDatasource {
  Future<Getalldata> getAllDataCached();
  Future<Unit> cacheAllDataData(Getalldata delegate);
}

class HomeLocalDataSourceImpl implements HomeLocalDatasource {
  final SharedPreferences sharedPreferences;
  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheAllDataData(Getalldata dataApp) {
    final dataAppJson = dataApp.toJson();
    sharedPreferences.setString(CachedAppKey.dataApp, json.encode(dataAppJson));
    return Future.value(unit);
  }

  @override
  Future<Getalldata> getAllDataCached() {
    final jsonString = sharedPreferences.getString(CachedAppKey.dataApp);
    if (jsonString != null) {
      final decodeJson = json.decode(jsonString);
      return Future.value(Getalldata.fromJson(decodeJson));
    } else {
      throw EmptyCacheException();
    }
  }
}
