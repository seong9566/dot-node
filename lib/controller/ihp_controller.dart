import 'package:dio/dio.dart';
import 'package:dot_node/core/network/dot_api.dart';
import 'package:dot_node/core/util/urls.dart';
import 'package:dot_node/model/login_model.dart';

class DotController {
  DotController._();
  static final DotController _instance = DotController._();

  factory DotController() => _instance;

  final DotApi _dotApi = DotApi(
    Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 60),
        // 60 seconds
        receiveTimeout: const Duration(seconds: 60), // 60 seconds
      ),
    ),
  );

  Future<LoginModel> login(
      {required String userEmail, required String userPassword}) async {
    return await _dotApi.login(
        userEmail: userEmail, userPassword: userPassword);
  }
}
