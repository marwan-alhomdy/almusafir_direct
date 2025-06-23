import 'dart:developer';
import 'dart:io';

import 'package:almusafir_direct/core/constants/endpoint.dart';
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
      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse(response);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> postWithGetAllResponse({
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

      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse2(response);
      }
    } catch (e) {
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

      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse(response);
      }
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
      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse(response);
      }
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
      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse(response);
      }
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

      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse(response);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<dynamic> updateFile({
    required String endPoint,
    required File file,
    required String fileField,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    String baseUrl = BASE_URL,
  }) async {
    try {
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        fileField: await MultipartFile.fromFile(file.path, filename: fileName),
      });

      var response = await _dio.post(
        '$baseUrl$endPoint',
        data: formData,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? HeaderServer.headerFile),
      );

      if (response.data["status"] == false) {
        _responseError(response, endPoint);
      } else {
        return _checkResponse(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  dynamic _checkResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    if (statusCode == 200 || statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 412) {
      throw SigOutExecption();
    } else if (statusCode >= 400 && statusCode <= 404) {
      final message = response.data["message"];
      throw ServerExecption(message: message?.toString());
    } else {
      throw ServerExecption();
    }
  }

  Response _checkResponse2(Response response) {
    final statusCode = response.statusCode ?? 0;
    if (statusCode >= 200 && statusCode <= 299) {
      return response;
    } else if (response.statusCode == 412) {
      throw SigOutExecption();
    } else if (statusCode >= 400 && statusCode <= 404) {
      final message = response.data["message"];
      throw ServerExecption(message: message?.toString());
    } else {
      throw ServerExecption();
    }
  }

  void _responseError(Response response, String endPoint) {
    final error = response.data["error"] ?? "";
    final messageError = response.data["message"] ?? "";
    final message = "$messageError\n$error";
    log(message);
    if (endPoint == EndPointName.login) {
      throw AccountNotActiveExecption();
    } else if (endPoint == EndPointName.register) {
      throw AccountNotActiveExecption();
    } else if (endPoint == EndPointName.sendOtp) {}

    throw ServerExecption(message: message);
  }
}
