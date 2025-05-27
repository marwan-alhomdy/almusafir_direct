import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/config.dart';
import '../error/exception.dart';
import '../server/header_server.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
    String baseUrl = BASE_URL,
    void Function(Headers)? onHeaderResponse,
  }) async {
    try {
      var response = await _dio.get(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? HeaderServer.header),
      );

      if (onHeaderResponse != null) {
        onHeaderResponse(response.headers);
      }
      return _checkResponse(response, endPoint);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
    String baseUrl = BASE_URL,
  }) async {
    try {
      var response = await _dio.post(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? HeaderServer.header),
      );

      return _checkResponse(response, endPoint);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
    String baseUrl = BASE_URL,
  }) async {
    try {
      var response = await _dio.patch(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? HeaderServer.header),
      );
      return _checkResponse(response, endPoint);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> put({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
    String baseUrl = BASE_URL,
  }) async {
    try {
      var response = await _dio.put(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? HeaderServer.header),
      );
      return _checkResponse(response, endPoint);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> delete({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
    String baseUrl = BASE_URL,
  }) async {
    try {
      var response = await _dio.delete(
        '$baseUrl$endPoint',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? HeaderServer.header),
      );

      return _checkResponse(response, endPoint);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> _checkResponse(Response response, String endPoint) {
    final statusCode = response.statusCode ?? 0;
    if (statusCode == 200 || statusCode == 201) {
      return Future.value(response.data);
    } else if (response.statusCode == 412) {
      throw SigOutExecption();
    } else if (statusCode >= 400 && statusCode <= 404) {
      final message = response.data["message"];
      throw ServerExecption(message: message?.toString());
    } else {
      throw ServerExecption();
    }
  }
}
