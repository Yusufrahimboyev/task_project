import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

enum Method { get, put, post, delete }

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<bool> checkConnection() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }
}
