import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../helper/language.helper.dart';
import '../constants/failure.dart';
import '../server/error_token.dart';

abstract class Failure extends Equatable {
  String get message;
}

//الاخطاء المتوقعة
//خطاء لايوجد نت
class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: OFFLINE_FAILURE_MESSAGE_AR,
        english: OFFLINE_FAILURE_MESSAGE_EN,
      );
}

//   خطاء في جلب البيانات من الداتابيز المحلية

//خطاء بسيرفر
class ServerFailure extends Failure {
  @override
  final String message;

  ServerFailure([this.message = ""]);

  @override
  List<Object?> get props => [];
}

class CustomrHasNoAccessFailure extends Failure {
  @override
  final String message;

  CustomrHasNoAccessFailure([this.message = ""]);

  @override
  List<Object?> get props => [];
}

class EtagFailure extends Failure {
  @override
  final String message;

  EtagFailure([this.message = ""]);

  @override
  List<Object?> get props => [];
}

//
class DioFailure extends Failure {
  @override
  final String message;

  DioFailure([this.message = ""]);

  static Failure fromAuthErorrResponse(DioException e) {
    try {
      if (e.response?.statusCode == 407) {
        final error = e.response?.data["message"];

        return error != null
            ? CustomrHasNoAccessFailure(error.toString())
            : DioFailure.fromDiorError(e);
      }
      return DioFailure.formDioErorResponse(e);
    } catch (e) {
      return DioFailure(e.toString());
    }
  }

  factory DioFailure.formDioErorResponse(DioException e) {
    try {
      switch (e.type) {
        case DioExceptionType.badResponse:
          return e.response?.data["errors"] != null
              ? DioFailure((e.response?.data["errors"] ?? {}).toString())
              : DioFailure.fromDiorError(e);
        default:
          return DioFailure.fromDiorError(e);
      }
    } catch (e) {
      return DioFailure(e.toString());
    }
  }

  factory DioFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "انتهت مهلة الاتصال بخادم API",
            english: 'Connection timeout with API server',
          ),
        );
      case DioExceptionType.sendTimeout:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "انتهت مهلة الإرسال إلى خادم API",
            english: 'Send timeout with API server',
          ),
        );
      case DioExceptionType.receiveTimeout:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "انتهت مهلة الاستلام من خادم API",
            english: 'Receive timeout with API server',
          ),
        );
      case DioExceptionType.badCertificate:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "شهادة غير صالحة مع خادم API",
            english: 'Bad certificate with API server',
          ),
        );
      case DioExceptionType.badResponse:
        return DioFailure.fromResponse(
          e.response?.statusCode ?? 0,
          e.response?.data ?? {},
        );
      case DioExceptionType.cancel:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "تم إلغاء الطلب إلى خادم API",
            english: 'Request to API server was canceled',
          ),
        );
      case DioExceptionType.connectionError:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "لا يوجد اتصال بالإنترنت",
            english: 'No internet connection',
          ),
        );
      case DioExceptionType.unknown:
        return DioFailure(
          LanguageHelper.chooseLabelLanguage(
            arabic: "عذرًا، حدث خطأ. يرجى المحاولة مرة أخرى",
            english: 'Oops, there was an error. Please try again',
          ),
        );
    }
  }

  factory DioFailure.fromResponse(statusCode, dynamic response) {
    if (statusCode == 401) {
      try {
        if (response is Map) {
          final message = response['error']['message'] ?? "";
          ErrorTokenAuth.scanTokenAuth(message);
          return DioFailure(message ?? '');
        } else {
          return DioFailure(response['message'] ?? "");
        }
      } catch (e) {/***/}
    }
    if (response is Map &&
        response["message"] != null &&
        response["error"] != null) {
      final error = response["error"]?.toString() ?? "";
      final messageError = response["message"]?.toString() ?? "";
      final message = "$messageError\n$error";
      return DioFailure(message);
    } else if (statusCode == 404) {
      return DioFailure(
        LanguageHelper.chooseLabelLanguage(
          arabic: "طلبك غير موجود، يرجى المحاولة لاحقًا",
          english: 'Your request was not found, please try later',
        ),
      );
    } else if (statusCode == 500) {
      return DioFailure(
        LanguageHelper.chooseLabelLanguage(
          arabic: "هناك مشكلة في الخادم، يرجى المحاولة لاحقًا",
          english: 'There is a problem with the server, please try later',
        ),
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return DioFailure(response['message'] ?? "");
    } else if (statusCode == 407) {
      return DioFailure(response['message'] ?? "");
    } else {
      return DioFailure(
        LanguageHelper.chooseLabelLanguage(
          arabic: "حدث خطأ، يرجى المحاولة مرة أخرى",
          english: 'There was an error, please try again',
        ),
      );
    }
  }

  @override
  List<Object?> get props => [];
}

//خطاء بحالة لا توجد  بيانات بالكاش
class EmtyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: EMPTY_CACHE_FAILURE_MESSAGE_AR,
        english: EMPTY_CACHE_FAILURE_MESSAGE_EN,
      );
}

//خطاء بادخال البيانات
class WrongDataFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => "";
}

class InvalidEmailOrPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: INVALID_EMAIL_OR_PASSWORD_AR,
        english: INVALID_EMAIL_OR_PASSWORD_EN,
      );
}

class OTPNotValiedFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: OTP_NOT_VALIED_AR,
        english: OTP_NOT_VALIED_EN,
      );
}

class OldPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: OLD_PASSWORD_AR,
        english: OLD_PASSWORD_EN,
      );
}

class CustomerExistisFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: CUSTOMER_EXISTIS_AR,
        english: CUSTOMER_EXISTIS_EN,
      );
}

class AccountNotActiveFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: ACCOUNT_NOT_ACTIVE_AR,
        english: ACCOUNT_NOT_ACTIVE_EN,
      );
}

class CustomerNotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => LanguageHelper.chooseLabelLanguage(
        arabic: CUSTOMER_NOT_FOUND_AR,
        english: CUSTOMER_NOT_FOUND_EN,
      );
}
