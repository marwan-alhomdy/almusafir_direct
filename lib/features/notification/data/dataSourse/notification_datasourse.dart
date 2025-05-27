import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/config.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/server/error_token.dart';
import '../../../../core/server/header_server.dart';
import '../../domain/entities/notification.dart';
import '../models/notification.dart';

abstract class NotifactionDataRemoteDataSource {
  Future<Unit> readNotification({required int id});
  Future<List<Notification>> getNofiication();
}

class NotifactionDataRemoteDataSourceHttp
    extends NotifactionDataRemoteDataSource {
  final http.Client client;
  NotifactionDataRemoteDataSourceHttp({required this.client});

  @override
  Future<Unit> readNotification({required int id}) async {
    try {
      final response = await client.patch(
          Uri.parse("${BASE_URL}read-notification"),
          headers: HeaderServer.headerWithToken,
          body: json.encode({"id": id}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Future.value(unit);
      } else if (response.statusCode == 401) {
        ErrorTokenAuth.logoutApp();
        throw ServerExecption();
      } else {
        throw ServerExecption();
      }
    } catch (e) {
      throw ServerExecption();
    }
  }

  @override
  Future<List<Notification>> getNofiication() async {
    try {
      final response = await client.get(Uri.parse("${BASE_URL}notifications"),
          headers: HeaderServer.headerWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodeJson = json.decode(response.body);
        final List<NotificationModel>? notifications = (decodeJson["data"]
                ["notifications"] as List<dynamic>?)
            ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return notifications ?? [];
      } else if (response.statusCode == 401) {
        ErrorTokenAuth.logoutApp();
        throw ServerExecption();
      } else {
        throw ServerExecption();
      }
    } catch (e) {
      throw ServerExecption();
    }
  }
}
