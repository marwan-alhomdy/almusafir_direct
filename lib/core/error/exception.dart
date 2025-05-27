class ServerExecption implements Exception {
  final String? message;
  ServerExecption({this.message});
}

class OfflineExecption implements Exception {}

class DbAsyncExecption implements Exception {}

class EmptyCacheException implements Exception {}

class InvalidEmailOrPasswordExecption implements Exception {}

class OTPNotValiedExecption implements Exception {}

class SigOutExecption implements Exception {}

class OldPasswordExecption implements Exception {}

class CustomerExistisExecption implements Exception {}

class AccountNotActiveExecption implements Exception {}

class CustomerNotFoundExecption implements Exception {}
