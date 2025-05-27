import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp extends NetworkInfo {
  InternetConnection connectionChecker;
  NetworkInfoImp({required this.connectionChecker});
  @override
  Future<bool> get isConnected => connectionChecker.hasInternetAccess;
}
