import 'delegate.module.dart';

class UserModel {
  DelegateModule? user;
  String? accessToken;

  UserModel({this.user, this.accessToken});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: json['user'] == null
            ? null
            : DelegateModule.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'],
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'access_token': accessToken,
      };
}
